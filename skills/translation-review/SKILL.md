---
name: translation-review
description: Review Chinese↔English translations for quality issues — terminology, grammar, consistency, formatting. Two workflows: CSV/XLSX batch review (write .dj suggestions) and .dj comparison line-by-line review (surgical patching).
---

# Translation Review

Two workflows, used depending on input format.

## Workflow A: CSV/XLSX batch review

Use when input is a CSV/XLSX with `Chinese`/`English` columns. Produces an `edit-suggestions.dj` file.

### 1. Get the data into CSV

If XLSX, export to CSV (or use `openpyxl`). CSV is faster.

### 2. Read the full file

Use `read_file` with offsets for complete coverage. Don't sample.

### 3. Write a systematic analysis script

Write to `/tmp/script.py`, run with `python3 /tmp/script.py`. No heredocs or `-c`.

The script should:
- Parse CSV with `csv.DictReader`
- Apply detection rules per category
- Collect issues: row number, CN text, EN text, problem, suggested fix
- Group/deduplicate identical issues

Common detection categories:
- **Buddhist terminology**: 正念→mindfulness (not "righteous thoughts"), 布施→generosity (not "alms")
- **Identity terms**: 学士/修士/胜士/智士 are practice stages, not titles
- **Literal machine translations**: "hard drive" for 硬盘 (endurance)
- **四摄法 terms**: 同事→"acting in harmony", 爱语→"kind speech"
- **Grammar**: subject-verb agreement, unbalanced quotes
- **Typos/formatting**: Chinese punctuation in English, "IOS"→"iOS"
- **Inconsistency**: same CN term translated differently across rows

### 4. Write edit-suggestions.dj

Format:
```
# 1

original: <Chinese text or key term>
translated: <current English>

<Explanation and suggested fix.>

# 2
...
```

One entry per problem category, not per row. Mention affected row numbers.

## Workflow B: .dj comparison file review

Use when input is a `.dj` comparison file (Chinese/English alternating line pairs). Produces `translation-findings.dj` and applies patches.

### 1. Read the full file

Use `terminal: cat` — `read_file` deduplicates within a session.

### 2. Scan for problems (ordered by severity)

**Terms database drift** (systematic):
- Cross-reference glossary terms against the MPI terms database
- HTTP API: `http://localhost:8910/search?q=...` (start: `python3 /home/user/documents/mpi/terms-search/server.py &`)
- Prefer DoT定稿 > 内部特色词 > 佛教术语 > 经论名
- Fix both glossary comments AND body text
- See `references/terms-db-alignment.md` for batch-lookup patterns

**Real errors** (affect meaning):
- Mistranslation of key terms
- Garbled/malformed source text
- Wrong proper names or technical terms

**Inconsistency** (confusing but not wrong):
- Terminology drift across file
- Numbering style chaos
- Grammatical voice/person shifts

**Cleanup needed**:
- Processing artifacts (HTML comments, markers)
- Stray spacing in Chinese text
- Awkward line splits
- Odd word choices

**Missing content**: bare headings with no body — flag, don't invent.

### 3. Dump findings to `translation-findings.dj`

```
Finding N — Title (line numbers)
  Chinese: ...
  English: ...
  Issue: description
```

### 4. Apply fixes with `patch`

Surgical string replacement. Verify every patch with `cat` — never rely on `read_file` (session dedup).

## Buddhist terminology reference

See `references/buddhist-terminology.md` for Chinese-English term mappings and common pitfalls.

## Pitfalls

- **Don't use heredocs or `-c`** — write to `/tmp/script.py` first
- **Deduplicate aggressively** — group by problem type, not per-row
- **Buddhist terminology is technical** — don't guess. When uncertain, flag for review
- **Never delete .dj comparison files** — intentional work artifacts
- **Verify patches with `cat`** — `read_file` dedup makes it unreliable
- **Re-read before fixing** — user may have made interim edits

## References

- `references/buddhist-terminology.md` — Chinese-English Buddhist term mappings and pitfalls
- `references/terms-db-alignment.md` — Batch-aligning glossary terms against the MPI terms database
