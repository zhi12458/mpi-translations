#!/usr/bin/env fish
# Generate bilingual.dj from source.dj + target.dj in a directory
# Usage: gen-bilingual <dir-containing-source.dj-and-target.dj>

set dir (realpath $argv[1])
set src "$dir/source.dj"
set tgt "$dir/target.dj"
set out "$dir/bilingual.dj"

if not test -f $src; or not test -f $tgt
    echo "Missing source.dj or target.dj in $dir" >&2
    exit 1
end

python3 -c "
import sys
src_path, tgt_path, out_path = sys.argv[1:]

with open(src_path) as f:
    src_lines = f.read().splitlines()
with open(tgt_path) as f:
    tgt_lines = f.read().splitlines()

src_toc = src_lines[4:32]
tgt_toc = tgt_lines[4:32]
src_body = src_lines[33:]
tgt_body = tgt_lines[33:]

out = []

out.append(src_lines[0])
out.append(tgt_lines[0])
out.append('')

out.append(src_lines[2])
out.append(tgt_lines[2])
out.append('')

for line in src_toc:
    out.append(line)
out.append('')
for line in tgt_toc:
    out.append(line)
out.append('')

for s, t in zip(src_body, tgt_body):
    if s == '' and t == '':
        continue
    out.append(s)
    out.append(t)
    out.append('')

with open(out_path, 'w') as f:
    f.write(chr(10).join(out))
" $src $tgt $out

echo $out
