#!/usr/bin/env python3
"""Mechanical sweep for .dj translation review — run after patches or as final verification.

Usage: python3 sweep.py <source.dj> <target.dj> [--stale term1,term2] [--new term1,term2]

Checks:
  1. Non-empty line count parity (source == target)
  2. Heading count parity
  3. Zero Markdown bold (**) in target (djot uses single *)
  5. Zero common Chinese punctuation in target
  6. Zero [text](#anchor) link artifacts in target TOC area (first 15 lines)
  7. Zero unbalanced double-quotes in target
  8. --stale: each listed string must appear ZERO times in target
  9. --new: each listed string must appear at least once in target
"""

import re
import sys


CN_PUNCT = re.compile(r'[\u3000-\u303f\uff00-\uffef\u201c\u201d\u2018\u2019]')

def read_nonempty(path):
    with open(path) as f:
        return [l for l in f.read().rstrip('\n').split('\n') if l.strip()]


def main():
    if len(sys.argv) < 3:
        print("Usage: sweep.py <source.dj> <target.dj> [--stale a,b,c] [--new x,y,z]")
        sys.exit(2)

    src_path = sys.argv[1]
    tgt_path = sys.argv[2]

    stale_terms = []
    new_terms = []
    i = 3
    while i < len(sys.argv):
        if sys.argv[i] == '--stale' and i + 1 < len(sys.argv):
            stale_terms = [t.strip() for t in sys.argv[i+1].split(',') if t.strip()]
            i += 2
        elif sys.argv[i] == '--new' and i + 1 < len(sys.argv):
            new_terms = [t.strip() for t in sys.argv[i+1].split(',') if t.strip()]
            i += 2
        else:
            i += 1

    src_lines = read_nonempty(src_path)
    tgt_lines = read_nonempty(tgt_path)
    tgt_raw = open(tgt_path).read()

    errors = 0

    # 1. Line count
    if len(src_lines) != len(tgt_lines):
        print(f"[FAIL] Line count: src={len(src_lines)} tgt={len(tgt_lines)}")
        errors += 1
    else:
        print(f"[OK] Line count: {len(src_lines)}")

    # 2. Heading count
    src_h = sum(1 for l in src_lines if l.startswith('## '))
    tgt_h = sum(1 for l in tgt_lines if l.startswith('## '))
    if src_h != tgt_h:
        print(f"[FAIL] Headings: src={src_h} tgt={tgt_h}")
        errors += 1
    else:
        print(f"[OK] Headings: {src_h}")

    # 3. Unicode em/en-dash
    em = tgt_raw.count('\u2014')
    en = tgt_raw.count('\u2013')
    if em or en:
        print(f"[FAIL] Unicode dashes: em-dash={em} en-dash={en}")
        errors += 1
    else:
        print("[OK] No Unicode em/en-dashes")

    # 4. Markdown bold
    bold = sum(1 for l in tgt_lines if '**' in l)
    if bold:
        print(f"[FAIL] Markdown bold (**): {bold} lines")
        errors += 1
    else:
        print("[OK] No Markdown bold")

    # 5. Chinese punctuation
    cn = [(i+1, l[:60]) for i, l in enumerate(tgt_lines) if CN_PUNCT.search(l)]
    if cn:
        print(f"[FAIL] Chinese/smart punct: {len(cn)} lines")
        for ln, snippet in cn[:5]:
            print(f"  L{ln}: {snippet}")
        errors += 1
    else:
        print("[OK] No Chinese punctuation")

    # 6. TOC link artifacts (first 15 lines)
    toc_links = sum(1 for l in tgt_lines[:15] if re.search(r'\[.*?\]\(#', l))
    if toc_links:
        print(f"[FAIL] TOC has [text](#anchor) links: {toc_links}")
        errors += 1
    else:
        print("[OK] TOC clean (no link artifacts)")

    # 7. Unbalanced quotes
    for i, l in enumerate(tgt_lines):
        if l.count('"') % 2 != 0:
            print(f"[FAIL] L{i+1}: Unbalanced quotes: {l[:80]}")
            errors += 1
    if errors == sum(1 for l in tgt_lines if l.count('"') % 2 != 0):
        pass  # errors already counted above
    elif not any(l.count('"') % 2 != 0 for l in tgt_lines):
        print("[OK] No unbalanced quotes")

    # 8. Stale terms (must be absent)
    for term in stale_terms:
        count = tgt_raw.count(term)
        if count > 0:
            print(f"[FAIL] Stale term '{term}' still present: {count}")
            errors += 1
        else:
            print(f"[OK] Stale term '{term}' absent")

    # 9. New terms (must be present)
    for term in new_terms:
        count = tgt_raw.count(term)
        if count == 0:
            print(f"[FAIL] New term '{term}' not found")
            errors += 1
        else:
            print(f"[OK] New term '{term}' found: {count}")

    print(f"\n{'ALL CLEAN' if errors == 0 else f'{errors} ISSUE(S) FOUND'}")
    sys.exit(0 if errors == 0 else 1)


if __name__ == '__main__':
    main()
