#!/usr/bin/env bash
# Generate docx files from source.dj and target.dj
# Usage: ./make-docx.sh [dir]
#   dir defaults to current directory, must contain source.dj and target.dj

set -euo pipefail
DIR="${1:-.}"
DIR="$(realpath "$DIR")"
BASENAME="$(basename "$DIR")"

SRC="$DIR/source.dj"
TGT="$DIR/target.dj"
CMP="$DIR/comparison.dj"

if [[ ! -f "$SRC" ]]; then echo "ERROR: $SRC not found"; exit 1; fi
if [[ ! -f "$TGT" ]]; then echo "ERROR: $TGT not found"; exit 1; fi

# Generate comparison.dj (ZH line, then EN line)
python3 - "$SRC" "$TGT" "$CMP" << 'PYEOF'
import sys
src_path, tgt_path, cmp_path = sys.argv[1:]
src = open(src_path).read()
tgt = open(tgt_path).read()
sl = src.split('\n')
tl = tgt.split('\n')
out = []
for i in range(max(len(sl), len(tl))):
    zh = sl[i] if i < len(sl) else ''
    en = tl[i] if i < len(tl) else ''
    if zh == '' and en == '':
        out.append('')
    else:
        out.append(zh)
        out.append(en)
open(cmp_path, 'w').write('\n'.join(out))
print(f'comparison.dj: {len(out)} lines')
PYEOF

# Convert to docx
pandoc "$CMP" -f djot -t docx -o "$DIR/${BASENAME}-中英对照.docx"
pandoc "$TGT" -f djot -t docx -o "$DIR/${BASENAME}-英文版.docx"

echo "Done:"
echo "  $DIR/${BASENAME}-中英对照.docx"
echo "  $DIR/${BASENAME}-英文版.docx"
