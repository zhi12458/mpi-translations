---
name: translation-review
description: Review Chinese-English translations for quality issues - terminology, grammar, consistency, formatting. Two workflows: CSV/XLSX batch review (write .dj suggestions) and .dj comparison line-by-line review (surgical patching).
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

**Sanity checks first** (mechanical, no judgment needed):
- **Line count**: source and target must match exactly. Mismatch means paragraphs were dropped, merged, or split.
- **Em-dash convention**: AGENTS.md says English em-dash (`—`) → three hyphens (`---`). The Chinese source often uses `------` (six hyphens) as its em-dash equivalent — convert to `---` in target, not to a Unicode `—`. A find/replace `—` → `---` over the target file catches all instances at once; a typical long file has 30–50.
- **TOC format**: AGENTS.md says TOC must be a plain bullet list, no link targets. If target still has `[I. Heading](#...)` markdown links, strip them.

**Terms database drift** (systematic):
- Cross-reference glossary terms against the MPI terms database
- CLI preferred: `python3 /home/user/documents/mpi/terms-search/search.py <query>`. For a review, batch many queries in one `execute_code` script (subprocess loop) — one terminal call per term is slow and noisy.
- Source priority: DoT定稿 > 内部特色词 > 佛教术语 > 经论名
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
- Redundant English calques: when the target mirrors a Chinese grammar pattern literally, it can read as a typo (e.g. "mind of death-mindfulness" for 念死之心 — should be "mindfulness of death").
- Clunky idioms: 一念之差 → "a single thought of difference" is unidiomatic. Standard renderings exist (e.g. "a single errant thought", "a moment's carelessness", or rephrase as "a single thought can make all the difference").

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
- **Em-dash drift**: AGENTS.md mandates `—` (Unicode em-dash) → `---` (three hyphens) in English djot. The Chinese source often uses `------` (six hyphens) as its em-dash equivalent; converters or translators may preserve it as a Unicode `—` in the target, which is a convention violation. Run a single find/replace `—` → `---` over the target. Long files typically have 30–50 such instances.
- **Batch terminology lookups** — when checking many terms against the terms DB, run them in one `execute_code` script that loops over a query list and calls `search.py` via `subprocess.run`. One terminal call per term floods the context with repetitive output.
- **Clunky idioms aren't translation errors, they're review items** — a literal calque of a Chinese idiom can read as a typo to a native English reader. Flag these under "Cleanup needed", not "Real errors", and suggest a standard rendering rather than trying to fix in place without confirmation.
- **Stale-phrasing sweep before declaring done** — after applying patches, run a single script that asserts the target contains zero of the fixed-but-replaced strings, zero Unicode em/en-dashes, and the expected count of the new phrasings. Missed instances (e.g. "mind of death-mindfulness" fixed on L21–L24 but forgotten on L68) survive regular spot-checks. Use `stale = [...]` and `new = [...]` lists; print `[STILL PRESENT (N)]` and `[OK]` per item. Also assert `line_count == source.line_count` and `heading_count == source.heading_count`.

## References

- `references/buddhist-terminology.md` — Chinese-English Buddhist term mappings and pitfalls
- `references/terms-db-alignment.md` — Batch-aligning glossary terms against the MPI terms database
