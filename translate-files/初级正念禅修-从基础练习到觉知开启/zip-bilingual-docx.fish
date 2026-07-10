#!/usr/bin/env fish
# Convert bilingual.dj to docx and package it in a zip file in /tmp/
# Usage: zip-bilingual-docx.fish [bilingual.dj]
#   Defaults to bilingual.dj in the current directory.

set input (realpath (set -q argv[1]; and echo $argv[1]; or echo "bilingual.dj"))
set name (basename (dirname $input))
set docx "/tmp/$name-bilingual.docx"
set zip "/tmp/$name-bilingual.zip"

pandoc $input -f djot -t docx -o $docx

rm -f $zip
zip -j $zip $docx

echo $zip
