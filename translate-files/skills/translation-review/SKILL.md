---
name: translation-review
description: Review Chinese↔English translation pairs for quality issues — terminology errors, grammar, consistency, formatting. Works with CSV/XLSX files and writes edit suggestions in .dj format.
---

# Translation Review

## When to use

- User has a CSV or XLSX file with `Chinese`/`English` (or similar) columns
- User asks you to "find problems," "check translations," or "review localization"
- User mentions `.dj` edit-suggestions files

## Workflow

### 1. Get the data into CSV

If the file is XLSX, have the user export to CSV (or use `openpyxl` if installed). CSV is easier and faster to process. The user may also provide XHTML — CSV is preferred.

### 2. Read the full file

Use `read_file` with offsets to get the complete CSV into context. Don't sample — issues repeat across rows and you need full coverage.

### 3. Write a systematic analysis script

Write a Python script to `/tmp/` and run it with `terminal: python3 /tmp/script.py`. Do NOT use heredocs (`<<'PYEOF'`) or `-c` — the terminal tool may block these. Always write to a temp file.

The script should:
- Parse the CSV with `csv.DictReader`
- Apply detection rules (regex-based) for each known issue category
- Collect issues with: CSV row number, page context, CN text, EN text, problem description, suggested fix
- Group/deduplicate identical issues across rows

Common detection categories for Chinese→English:
- **Buddhist terminology**: 正念→mindfulness (not "righteous thoughts"), 布施→generosity (not "alms"), 胜解→resolute conviction, etc.
- **Identity terms**: 学士/修士/胜士/智士 are practice stages, not "bachelor/monk/winner/wise man"
- **Literal machine translations**: "Is we"→"if we", "hard drive" for 硬盘 (endurance), "Walk without letting go" for 行舍不放逸
- **四摄法 terms**: 同事→"acting in harmony" (not "colleagues"), 爱语→"kind speech" (not "love words")
- **Grammar**: subject-verb agreement, "have it been"→"has it been", unbalanced quotes
- **Typos/formatting**: "AndroidAndroid", "IOS"→"iOS", unbalanced HTML tags, Chinese punctuation in English
- **UI terminology**: "Suspended"→"Paused" for media, product name consistency
- **Inconsistency**: same CN term translated differently across rows (e.g., "Bodhi Navigator" vs "Bodhi Navigation")

### 4. Deduplicate into unique issue categories

The same error pattern often repeats across many rows (e.g., "subversion" for 覆 appears in 6+ rows). Group these into single entries in the .dj file — one entry per unique problem, with a list of affected rows.

### 5. Write edit-suggestions.dj

Format:

```
# 1

original: <Chinese text or key term>
translated: <current English>

<Explanation of the problem and suggested fix.>

# 2
...
```

Each entry gets a `# N` header, `original:` and `translated:` fields, then a free-text explanation. End with suggested replacement text. Mention affected row numbers. For globally-wrong terms, note "Change globally."

Do NOT write one entry per CSV row — group by problem type.

### 6. Sanity check

Run a quick second pass to catch: empty English fields, Chinese characters leaking into English column, untranslated rows (CN == EN), trailing whitespace.

## Pitfalls

- **Don't use heredocs or `-c` for multi-line Python** — write to `/tmp/script.py` first, then `python3 /tmp/script.py`. The terminal tool may block heredocs as long-lived processes.
- **Deduplicate aggressively** — 80+ raw issues may collapse to 20-25 unique categories. Writing one .dj entry per CSV row is useless noise.
- **Buddhist terminology is technical** — don't guess. 正念 is mindfulness (sati), not "righteous thoughts." 唯识 is Yogācāra/Consciousness-Only, not "knowledge and view alone." When uncertain, flag for human review rather than confidently suggesting wrong fixes.
- **Don't delete the comparison/对照 file** — translation projects keep these as intentional work artifacts.

## .dj file format reference

```
# N

original: <source text>
translated: <current translation>

<Free-text explanation and suggestion. Can be multiple paragraphs.>

# N+1
...
```

Entries may end with `{% TK %}` to mark "to check" items. The file lives alongside the source CSV/XLSX in the same directory.
