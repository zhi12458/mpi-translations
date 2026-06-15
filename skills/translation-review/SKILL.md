---
name: translation-review
description: Review Chinese-English translations for quality issues - terminology, grammar, consistency, formatting. Two workflows - CSV/XLSX batch review (write .dj suggestions) and .dj comparison line-by-line review (surgical patching).
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

Use when input is a `.dj` comparison file (Chinese/English alternating line pairs).

### Two modes — always clarify which one

AGENTS.md defines two workflows. Before starting, determine which mode you're in:

1. **Translation review** (Workflow A in AGENTS.md): agent translated the text.
   Authoritative `target.dj` does not exist yet. Review everything:
   terminology, grammar, formatting, em-dashes, consistency, calques, missing content.
   Produces `translation-findings.dj` and applies patches.

2. **Proofread** (Workflow B in AGENTS.md): English comes from an existing DOCX
   manuscript. It is authoritative. Only flag manuscript-level mechanical issues:
   typos, double words, numbering mismatches, garbled text, duplicate text.
   Produces `edit-suggestions.dj` ONLY — do NOT apply patches without asking.
   Do NOT flag: terminology choices, djot formatting (em-dashes, italics),
   translation style, calques, word order. These are translation-review concerns.

### 1. Read the full file

Use `terminal: cat` — `read_file` deduplicates within a session.

### 2. Scan for problems (ordered by severity)

**Sanity checks first** (mechanical, no judgment needed):
- **Line count**: source and target must match exactly. Mismatch means paragraphs were dropped, merged, or split.
- **Em-dash convention**: AGENTS.md says English em-dash (`—`) → three hyphens (`---`). The Chinese source often uses `------` (six hyphens) as its em-dash equivalent — convert to `---` in target, not to a Unicode `—`. A find/replace `—` → `---` over the target file catches all instances at once; a typical long file has 30–50.
- **TOC format**: AGENTS.md says TOC must be a plain bullet list, no link targets. If target still has `[I. Heading](#...)` markdown links, strip them. Also check source TOC — per MPI conventions, both source and target should use clean bullet format.

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

**Missing content**:
- **Bare headings** with no body — flag, don't invent.
- **Mid-paragraph truncation** (common in MPI translations): CN paragraph covers 3–5 clauses but EN stops after 1–2 sentences. Detection: compare semantic density, not character count. CN often packs more meaning per character than EN. Signal: CN has quoted speech, poems, multiple examples, or a rhetorical climax that's absent from EN. Flag as "Missing Content" not "Incomplete" — these are usually draft-stage cutoffs, not intentional omissions.

### 3. Dump findings to `translation-findings.dj`

```
Finding N — Title (line numbers)
  Chinese: ...
  English: ...
  Issue: description
```

### 4. Apply fixes with `patch`

Surgical string replacement. Verify every patch with `cat` — never rely on `read_file` (session dedup).

### 5. Final sweep

Run `python3 scripts/sweep.py <source.dj> <target.dj> [--stale term1,term2] [--new term1,term2]`. This runs all mechanical checks in one call: line parity, heading parity, Unicode em/en-dashes, Markdown bold, Chinese punctuation, TOC link artifacts, unbalanced quotes, and stale/new term assertions. Run even when no content patches were needed — it serves as final validation.

## Buddhist terminology reference

See `references/buddhist-terminology.md` for Chinese-English term mappings and common pitfalls.

## Workflow C: Typeset proofread (DOCX manuscript vs PDF layout)

Use when the user gives a manuscript DOCX and a typeset PDF and asks to proofread.
Goal: catch typesetting errors (missing text, typos, wrong special characters, bad line
breaks), not translation quality.

### 0. Clarify scope FIRST

Before any extraction: ask what they want checked. "Proofread" can mean:
- Text accuracy (missing/doubled words, typos introduced by typesetter)
- Special characters (quotes, dashes, ellipses)
- Formatting (page numbers, headers, TOC layout)
- All of the above

Do not run extraction pipelines until scope is clear.

### 1. Extract text

- DOCX → plain: `pandoc file.docx -f docx -t plain --wrap=none`
- PDF → plain: `pdftotext -layout file.pdf` (preserves positional info)

### 2. Clean PDF artifacts

- Strip InDesign slug lines, page headers, page numbers
- Join hyphenated line breaks (line ending `-` + next line starting lowercase)
- Fix drop-cap artifacts (e.g. `L iving` → `Living`)

### 3. Compare

- Extract English paragraphs from DOCX (skip Chinese lines, match blank-line pattern)
- Check each DOCX paragraph exists as substring in PDF body text
- Flag paragraphs not found; investigate each (may be heading renumbering, not missing)

### Pitfalls specific to this workflow

- **PDF paragraph joining is lossy** — page breaks split paragraphs. Don't expect
  perfect paragraph matching; check content coverage, not paragraph identity.
- **Heading numbering differs** — DOCX has `1.`, `(1)`; PDF has `I`, `1)`. Ignore
  heading-only differences.
- **InDesign PDFs insert extra spaces** around drop caps and special characters.
  Normalize multi-space to single space before comparison.

## Pitfalls

- **Clarify scope before diving into extraction pipelines** — if the user says
  "proofread this" or "校对这篇文章", ask what specifically they want checked
  before running pandoc/pdftotext. Getting interrupted mid-pipeline wastes
  context.
- **Don't use heredocs or `-c`** — write to `/tmp/script.py` first
- **Deduplicate aggressively** — group by problem type, not per-row
- **Buddhist terminology is technical** — don't guess. When uncertain, flag for review
- **Never delete .dj comparison files** — intentional work artifacts
- **Verify patches with `cat`** — `read_file` dedup makes it unreliable
- **Re-read before fixing** — user may have made interim edits
- **Em-dash drift (translation mode only)**: AGENTS.md mandates `—` (Unicode em-dash) → `---` (three hyphens) in English djot for the translation workflow. When proofreading an existing DOCX manuscript, do NOT flag em-dashes — the manuscript's English is authoritative and this is a formatting concern for the translation workflow. If you're in translation mode and the target has Unicode em-dashes, run a single find/replace `—` → `---`. Long files typically have 30–50 such instances.
- **Batch terminology lookups** — when checking many terms against the terms DB, run them in one `execute_code` script that loops over a query list and calls `search.py` via `subprocess.run`. One terminal call per term floods the context with repetitive output.
- **Proofread ≠ translation review** — when the user says "校对" or "proofread" and the input is a DOCX manuscript with existing English, you are in proofread mode. Do NOT flag translation quality, terminology, or djot formatting. Do NOT apply patches to bilingual.dj unless asked. Write `edit-suggestions.dj` with manuscript-level issues only. If the user later asks for translation review of the same article, write findings to a separate `translation-findings.dj`.

## References

- `references/buddhist-terminology.md` — Chinese-English Buddhist term mappings and pitfalls
- `references/terms-db-alignment.md` — Batch-aligning glossary terms against the MPI terms database

## Scripts

- `scripts/sweep.py` — Mechanical validation sweep for completed reviews
- `scripts/review_csv.py` — Batch CSV/XLSX translation review