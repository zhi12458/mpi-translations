#!/usr/bin/env fish
# Convert target.dj to English docx
# Usage: dj2docx <path-to-target.dj>
#   Output: /tmp/<parent-dirname>-英文.docx

set tgt (realpath $argv[1])
set parent (basename (dirname $tgt))
set out "/tmp/$parent-英文.docx"
pandoc $tgt -f djot -t docx -o $out
echo $out
