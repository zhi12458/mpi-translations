#!/usr/bin/env fish
# Article-specific Typst compile script for 人生百问.
# Usage: compile-typst-b50c74.fish [output.pdf]
#   Output defaults to ./bilingual.pdf

set src (realpath ./bilingual.typ)
set root (realpath ..)

if set -q argv[1]
    set out (realpath $argv[1])
else
    set out (realpath ./bilingual.pdf)
end

typst compile --root $root $src $out
echo $out
