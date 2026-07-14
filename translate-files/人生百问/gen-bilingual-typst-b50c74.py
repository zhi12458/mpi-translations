#!/usr/bin/env python3
"""Regenerate source.dj, target.dj, bilingual.dj, and bilingual.typ
from the chapter files for 人生百问.

Usage:
    python3 gen-bilingual-typst-b50c74.py

The script:
1. Concatenates chapters/intro.dj, ch01.dj, ..., ch16.dj into source.dj.
2. Concatenates chapters/intro-target.dj, ch01-target.dj, ..., ch16-target.dj
   into target.dj.
3. Runs ../../toolkit/scripts/gen-bilingual.py to produce bilingual.dj.
4. Rebuilds bilingual.typ by preserving the existing Typst wrapper (header,
   title block, opening quote, and mpi-bilingual-outline show rule) and
   replacing only the body content with interleaved Chinese/English paragraphs
   in the same style as the current bilingual.typ.
"""

import re
import subprocess
import sys
from pathlib import Path

ARTICLE_DIR = Path(__file__).resolve().parent
TOOLKIT = (ARTICLE_DIR / ".." / ".." / "toolkit").resolve()
CHAPTERS = [
    "intro",
    "ch01", "ch02", "ch03", "ch04", "ch05", "ch06", "ch07",
    "ch08", "ch09", "ch10", "ch11", "ch12", "ch13", "ch14", "ch15", "ch16",
]


def concat_chapters():
    """Merge chapter files into source.dj and target.dj."""
    source = ARTICLE_DIR / "source.dj"
    target = ARTICLE_DIR / "target.dj"

    with source.open("w", encoding="utf-8") as sf, target.open(
        "w", encoding="utf-8"
    ) as tf:
        for ch in CHAPTERS:
            src_path = ARTICLE_DIR / "chapters" / f"{ch}.dj"
            tgt_path = ARTICLE_DIR / "chapters" / f"{ch}-target.dj"
            sf.write(src_path.read_text(encoding="utf-8"))
            sf.write("\n")
            tf.write(tgt_path.read_text(encoding="utf-8"))
            tf.write("\n")

    return source, target


def generate_bilingual_dj(source, target):
    """Run the existing gen-bilingual.py script."""
    bilingual = ARTICLE_DIR / "bilingual.dj"
    gen_script = TOOLKIT / "scripts" / "gen-bilingual.py"
    with bilingual.open("w", encoding="utf-8") as out:
        subprocess.run(
            [sys.executable, str(gen_script), str(source), str(target)],
            stdout=out,
            check=True,
        )
    return bilingual


def extract_wrapper(typ_path):
    """Return the existing Typst wrapper (everything up to and including the
    closing bracket of the opening quote block)."""
    with typ_path.open("r", encoding="utf-8") as f:
        lines = f.readlines()

    quote_start = None
    for i, line in enumerate(lines):
        if line.strip() == "#quote(block: true)[":
            quote_start = i
            break
    if quote_start is None:
        raise ValueError("Could not find opening quote block in bilingual.typ")

    wrapper_end = None
    for i in range(quote_start + 1, len(lines)):
        if lines[i].strip() == "]":
            wrapper_end = i
            break
    if wrapper_end is None:
        raise ValueError("Could not find closing bracket of opening quote block")

    return "".join(lines[: wrapper_end + 1])


def transform_pair(src, tgt, state):
    """Convert one source/target line pair into the body format used by
    bilingual.typ."""
    # Chapter heading
    if src.startswith("## ") and tgt.startswith("## "):
        state["chapter"] += 1
        state["question"] = 0
        label = f"<ch{state['chapter']:02d}>"
        return f"== {src[3:].strip()} / {tgt[3:].strip()} {label}\n\n"

    # Question heading
    if src.startswith("### ") and tgt.startswith("### "):
        state["question"] += 1
        label = f"<ch{state['chapter']:02d}-q{state['question']:02d}>"
        return f"=== {src[4:].strip()} / {tgt[4:].strip()} {label}\n\n"

    # Question marker
    if src.startswith("问：") and tgt.startswith("Q:"):
        new_src = re.sub(r"^问：", "_问：_ ", src)
        new_tgt = re.sub(r"^Q:\s*", "_Q:_ ", tgt)
        return f"{new_src}\n{new_tgt}\n\n"

    # Answer marker
    if src.startswith("答：") and tgt.startswith("A:"):
        new_src = re.sub(r"^答：", "_答：_ ", src)
        new_tgt = re.sub(r"^A:\s*", "_A:_ ", tgt)
        return f"{new_src}\n{new_tgt}\n\n"

    # Default paragraph pair
    return f"{src}\n{tgt}\n\n"


def generate_body(source, target):
    """Build the new body content from the merged source and target files."""
    src_lines = source.read_text(encoding="utf-8").splitlines()
    tgt_lines = target.read_text(encoding="utf-8").splitlines()

    if len(src_lines) != len(tgt_lines):
        raise ValueError(
            f"Line count mismatch: source={len(src_lines)} target={len(tgt_lines)}"
        )

    # Find the first chapter heading pair (skip intro title, subtitle, quote, TOC)
    start_idx = None
    for i in range(len(src_lines)):
        if src_lines[i].startswith("## ") and tgt_lines[i].startswith("## "):
            start_idx = i
            break
    if start_idx is None:
        raise ValueError("Could not find first chapter heading pair")

    state = {"chapter": 0, "question": 0}
    out_lines = []
    for i in range(start_idx, len(src_lines)):
        s = src_lines[i]
        t = tgt_lines[i]
        if s == "" and t == "":
            out_lines.append("")
            continue
        block = transform_pair(s, t, state)
        out_lines.extend(block.rstrip("\n").split("\n"))

    # Collapse runs of blank lines to a single blank line to match the original
    # bilingual.typ style.
    collapsed = []
    for line in out_lines:
        if line == "":
            if collapsed and collapsed[-1] == "":
                continue
        collapsed.append(line)
    # Ensure trailing newline
    return "\n".join(collapsed) + "\n"


def main():
    source, target = concat_chapters()
    bilingual = generate_bilingual_dj(source, target)

    wrapper = extract_wrapper(ARTICLE_DIR / "bilingual.typ")
    body = generate_body(source, target)

    with (ARTICLE_DIR / "bilingual.typ").open("w", encoding="utf-8") as f:
        f.write(wrapper)
        f.write("\n")
        f.write(body)

    # Basic verification
    src_lines = source.read_text(encoding="utf-8").splitlines()
    tgt_lines = target.read_text(encoding="utf-8").splitlines()
    print(f"source.dj: {len(src_lines)} lines")
    print(f"target.dj: {len(tgt_lines)} lines")
    print(f"bilingual.dj: {len(bilingual.read_text(encoding='utf-8').splitlines())} lines")
    if len(src_lines) != len(tgt_lines):
        print("ERROR: source and target line counts do not match", file=sys.stderr)
        sys.exit(1)
    print("bilingual.typ regenerated successfully")


if __name__ == "__main__":
    main()
