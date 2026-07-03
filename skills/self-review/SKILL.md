---
name: self-review
description: Review your own CN→EN translations — three-pass review (terminology → mechanical → flow). Edit commented.dj with patch. For reviewing someone else's work, load other-review.
inputs: bilingual.dj, or CSV/XLSX (Chinese + English columns)
outputs: commented.dj, translation-findings.dj (optional)
---

{% Serves AGENTS.md Workflow B1 (Self-Review) %}

# Self-Review（自审）

Review YOUR OWN translations. You created the English — you can edit freely.
For reviewing someone else's work, load `other-review` instead.

Two input formats: CSV/XLSX batch, or `.dj` comparison file.

`bilingual.dj` is script-generated ground truth — **never edit it.**
Copy to `commented.dj` for all review work. Always use `patch` (mode='replace')
for edits — not regex-based string replacement in `execute_code`.

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

## Workflow B: .dj file review (self-review)

Use when you translated the text and want to review your own work.

### File rules

1. `bilingual.dj` — extracted from script. **Never edit.**
2. `cp bilingual.dj commented.dj` — all edits go here
3. `{% ... %}` comments document non-obvious translation choices

### 1. Read the full file

Use `read_file` with `offset` and `limit` for full coverage of large files
(this session had 322 lines, 93KB). For files >200 lines, paginate
explicitly rather than reading the whole thing at once.

If you have already read part of the file with `read_file` earlier in the
session, use `terminal: cat` (or `sed -n 'A,Bp'`) to get an un-deduped view
of the rest. `read_file` deduplicates within a session.

### 2. Scan for problems — three passes, in order

The review is best done in three distinct passes, each catching a different
category of error. Don't try to catch everything in one scan.

**Pass 1 — terminology + consistency + line count** (fast, mechanical):
- **Line count**: source and target must match exactly. Mismatch means paragraphs were dropped, merged, or split.
- Same CN term translated differently across the file (e.g. 人生佛教/人间佛教 conflation, 恨→resentment, 修行/修学)
- Buddhist terminology against the MPI terms DB (see terms-db-alignment below)
- Mistranslation of key terms, wrong proper names, garbled text
- Mid-paragraph truncation: CN covers 3–5 clauses but EN stops after 1–2 sentences. Signal: CN has quoted speech, poems, or a rhetorical climax absent from EN. Flag as "Missing Content" not "Incomplete."
- Use `references/common-issues-taxonomy.md` as a structured checklist for accuracy issues

**Pass 2 — mechanical/formatting** (also mechanical, but easy to skip):
- TOC format: AGENTS.md says TOC must be plain bullet list, no link targets. Strip `[I. Heading](#...)` markdown links if present.
- Double words, double punctuation, capitalisation typos, processing artifacts, stray spacing in Chinese text
- Numbering mismatches between CN and EN headings
- Redundant English calques: when the target mirrors a Chinese grammar pattern literally, it can read as a typo (e.g. "mind of death-mindfulness" for 念死之心 — should be "mindfulness of death"). Clunky idioms: 一念之差 → "a single thought of difference" is unidiomatic. Standard renderings exist (e.g. "a single errant thought," "a moment's carelessness," or rephrase as "a single thought can make all the difference").

**Pass 3 — flow/tonal/calques** (read the whole English as prose):
- Re-read the full English target. Does it hang together as prose, or does it read as "translationese"?
- Dramatic verbs that are calques of Chinese: "draw forth," "into full play," "shoulder," "look to with hope." See `references/translation-pitfalls.md` for the full calque checklist.
- New: review the *人生百问* pattern tables in `translation-pitfalls.md` for stiff calques ("keen on," "wisdom culture," "more ultimate," "choice difficulty," "serve as reference") and idiom renderings ("tree wishing stillness," "straddling two boats").
- Subject-shift calques: English substitutes a concrete agent (practitioners, people) for an abstract system noun (Buddhism, religion) — see pitfalls.
- Factual inconsistencies across paired descriptions of the same person/place/thing.
- Tonal coherence inside parallel lists: verb choice should be identical across First/Second/Third items.
- Intensifier drift: same intensifier ("profoundly important") used 3+ times in one section reads as over-translation.
- The user may explicitly request this pass ("are the words together nicely?", "does it read well?"). Treat such prompts as a signal to do the full re-read, not just spot-check.

**Terms database drift** (cross-cutting — apply during Pass 1):
- Cross-reference glossary terms against the MPI terms database
- CLI preferred: `python3 $MPI_PROJECT_ROOT/terms-search/search.py <query>`. For a review, batch many queries in one `execute_code` script (subprocess loop) — one terminal call per term is slow and noisy.
- Source priority: DoT定稿 > 内部特色词 > 佛教术语 > 经论名
- Fix both glossary comments AND body text
- See `references/terms-db-alignment.md` for batch-lookup patterns

### 3. Dump findings

Write to `translation-findings.dj` for issues that don't fit as inline fixes:

```
Finding N — Title (line numbers)
  Chinese: ...
  English: ...
  Issue: description
```

### 4. Apply fixes with `patch`

Surgical string replacement in `commented.dj` with `patch` (mode='replace').
Never use regex-based string replacement in `execute_code` for .dj edits.
`patch` is safer, surfaces conflicts, and produces a reviewable diff.
Verify with `cat` — never rely on `read_file` (session dedup).

### 5. Add inline edit suggestions

Copy `bilingual.dj` → `commented.dj`, then apply inline corrections + `{% %}` comments.

### 6. Final sweep

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

### Pitfalls

- **Never edit `bilingual.dj`** — it's script-generated ground truth. Copy to `commented.dj` first.
- **Use `patch`, not regex** — for all `.dj` edits. `patch` surfaces conflicts and produces diffs.
- **`commented.dj` comments must not split paragraphs** — always place `{% %}` after the FULL EN paragraph, not mid-sentence. Scan for merged comments after insertions and split them. Collapse triple+ blank lines created by comment insertions.
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
- **Batch terminology lookups** — when checking many terms against the terms DB, run them in one `execute_code` script that loops over a query list and calls `search.py` via `subprocess.run`. One terminal call per term floods the context with repetitive output.
- **Mine review comments for patterns** — when a `review-comments.dj` is produced, scan it for recurring calques and term choices and add them to `references/translation-pitfalls.md` and `references/buddhist-terminology.md` so the skill improves with each review.

## Human Review Protocol (审议)

When giving feedback to human translators — whether in a review team or as an AI
assistant flagging issues — follow the Oriental Translation Workshop protocol.
See `references/deliberation-protocol.md` for full guidance.

Key points:
- **Rejoice first** (随喜): affirm what works before flagging issues
- **Three-tier issues**: Level 1 (spelling/grammar/format) — fix directly. Level 2
  (omission/mistranslation/wordiness) — suggest or fix with tracked changes. Level 3
  (citation versions / marginal wording) — discuss with translator
- **Tone**: questions, not commands; collaborative inquiry, not correction
- **Address translator as 菩萨** (Bodhisattva) — respectful peer

## Common Issues Taxonomy

Use `references/common-issues-taxonomy.md` as a structured checklist when reviewing.
Categories:

- **Accuracy**: omission, mistranslation (over-free, over-literal, misunderstanding,
  wrong word choice), overtranslation, terminology errors
- **Readability**: redundancy (long sentences, passive voice, nominalization),
  poor structure (top-heavy sentences), wrong register, weak transitions

## References

- `references/buddhist-terminology.md` — Chinese-English Buddhist term mappings and pitfalls
- `references/terms-db-alignment.md` — Batch-aligning glossary terms against the MPI terms database
- `references/translation-pitfalls.md` — Recurring CN→EN mistranslation patterns (关爱→compassion, 生生增上, etc.)
- `references/proofreading-patterns.md` — DOCX/PDF extraction techniques, block-based pairing, common manuscript issues
- `references/docx-md-extraction.md` — Extracting `.docx.md` (pandoc markdown) to bilingual, TOC guards, CN/EN boundary regex
- `references/edit-suggestions-in-bilingual.md` — Inline edit suggestions + `{% %}` comments, two-file comparison (commented.dj / bilingual.dj)
- `references/deliberation-protocol.md` — Oriental Translation Workshop review protocol: tiers, rejoicing, tone
- `references/common-issues-taxonomy.md` — Structured taxonomy of accuracy and readability issues with examples

## Scripts

- `scripts/sweep.py` — Mechanical validation sweep for completed reviews
- `scripts/review_csv.py` — Batch CSV/XLSX translation review