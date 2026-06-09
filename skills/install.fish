#!/usr/bin/env fish
# install.fish — Create symlinks from ~/.hermes/skills/ to ./skills/
# Run from the skills/ directory or set SKILLS_DIR.

set -q SKILLS_DIR; or set SKILLS_DIR (realpath (dirname (status filename)))
set HERMES_SKILLS "$HOME/.hermes/skills"

# skill name → category subdirectory under ~/.hermes/skills/
set -l names \
    pptx-translate \
    chinese-text-normalize \
    translation-review \
    dharma-translation
set -l cats \
    productivity \
    productivity \
    productivity \
    research

for i in (seq (count $names))
    set name $names[$i]
    set cat  $cats[$i]
    set src  "$SKILLS_DIR/$name"
    set dst  "$HERMES_SKILLS/$cat/$name"

    if not test -d "$src"
        echo "SKIP: source not found: $src"
        continue
    end

    if test -e "$dst" -o -L "$dst"
        rm -rf "$dst"
    end

    mkdir -p (dirname "$dst")
    ln -s "$src" "$dst"
    echo "LINKED: $dst -> $src"
end
