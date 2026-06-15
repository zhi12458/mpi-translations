#!/usr/bin/env fish
# Generate bilingual.dj from source.dj + target.dj
# Article-specific: 如何做好临终关怀
# Structure: title (L1), blank (L2), subtitle date (L3), blank (L4), author (L5), blank (L6), TOC L7-12, blank L13, body L14+

set dir (realpath (dirname (status filename)))
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

# Title: L1 (idx 0)
# Date subtitle: L3 (idx 2)
# Author: L5 (idx 4)
# TOC: L7-12 (idx 6-11)
# Body: L14+ (idx 13+)

src_toc = src_lines[6:12]
tgt_toc = tgt_lines[6:12]
src_body = src_lines[13:]
tgt_body = tgt_lines[13:]

out = []

# Title pair
out.append(src_lines[0])
out.append(tgt_lines[0])
out.append('')

# Date subtitle pair
out.append(src_lines[2])
out.append(tgt_lines[2])
out.append('')

# Author pair
out.append(src_lines[4])
out.append(tgt_lines[4])
out.append('')

# TOC blocks
for line in src_toc:
    out.append(line)
out.append('')
for line in tgt_toc:
    out.append(line)
out.append('')

# Body interleaved
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
