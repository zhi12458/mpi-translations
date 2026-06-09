#!/usr/bin/env python3
"""Reference: reusable detection rules for Chinese→English translation review.
Adapt the rules list for each project's domain vocabulary."""

import csv, re, sys

def review_csv(csv_path):
    rows = []
    with open(csv_path) as f:
        reader = csv.DictReader(f)
        for r in reader:
            rows.append((r.get('page', '') or '', r['Chinese'] or '', r['English'] or ''))

    issues = []

    def add(row_idx, cn, en, problem, suggestion):
        issues.append({
            'row': row_idx + 2,
            'page': rows[row_idx][0],
            'cn': cn, 'en': en,
            'problem': problem,
            'suggestion': suggestion
        })

    for i, (page, cn, en) in enumerate(rows):
        if not cn or not en:
            continue

        # ── Add project-specific detection rules below ──

        # Example: "Is we" → machine translation artifact
        if re.search(r'\bIs we\b', en):
            add(i, cn, en,
                "'Is we' — literal MT of 是否/如果. Should be 'if we' or 'whether we'",
                re.sub(r'\bIs we\b', 'if we', en))

        # Example: Chinese punctuation in English text
        if re.search(r'[，。；：！？、]', en):
            add(i, cn, en,
                "Chinese punctuation in English text",
                "[Replace with English punctuation]")

        # Example: unbalanced HTML tags
        if en.count('<b>') != en.count('</b>'):
            add(i, cn, en,
                f"Unbalanced <b> tags (open={en.count('<b>')}, close={en.count('</b>')})",
                "[Balance tags]")

        # Example: unbalanced double quotes
        if en.count('"') % 2 != 0:
            add(i, cn, en,
                f"Unbalanced quotes ({en.count(chr(34))} total)",
                "[Balance quotation marks]")

        # Example: term inconsistency check
        # if re.search(r'TermA', en) and re.search(r'TermB', en) and ...

    # ── Sanity checks ──
    for i, (page, cn, en) in enumerate(rows):
        if cn and not en:
            print(f"WARNING row {i+2}: CN present but EN empty: {cn[:80]}")
        cn_chars = re.findall(r'[\u4e00-\u9fff]', en)
        if cn_chars:
            print(f"WARNING row {i+2}: Chinese chars in EN: {cn_chars}")
        if cn and en and cn.strip() == en.strip():
            print(f"WARNING row {i+2}: CN==EN (untranslated): {cn[:60]}")

    return issues

if __name__ == '__main__':
    issues = review_csv(sys.argv[1])
    print(f"Issues found: {len(issues)}")
    for iss in issues:
        print(f"\nCSV_ROW_{iss['row']} [{iss['page']}]")
        print(f"  CN: {iss['cn'][:120]}")
        print(f"  EN: {iss['en'][:120]}")
        print(f"  PROBLEM: {iss['problem']}")
        print(f"  SUGGEST: {iss['suggestion'][:150]}")
