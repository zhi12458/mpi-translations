# MPI Project Conventions

## Skills

Skills in `skills/`. Loaded via `~/.hermes/config.yaml`:

```yaml
skills:
  external_dirs:
  - /home/user/documents/mpi/skills
```

{% `hermes config set` stringifies list values — edit config.yaml directly. %}

Available: `terms-search`, `dharma-translation`, `translation-review`, `chinese-text-normalize`, `pptx-translate`, `pdf-to-docx-conversion`.

## Terms Database

- DB: `terms-search/termlib.duckdb`
- CLI: `terms-search/search.py <query> [limit]` (preferred over HTTP)
- Module: `from search import search; search("空性", limit=5, loc="...", src="...")` → list of `{zh, en, loc, source}` dicts
- Priority: DoT定稿 > 内部特色词 > 佛教术语 > 经论名

## Directory Structure

```
translate-files/<topic>/<article>/
  source.dj      — Chinese original
  target.dj      — English translation (match source line count)
  bilingual.dj   — interleaved (source line, blank, target line, blank)
```

`.docx` output → `/tmp/`. Don't commit binaries.

---

## Workflow A: Translation（翻译）

Translate Chinese source into English. The agent IS the model — no external APIs.

### Input

Source text in `.dj` or `.docx` (Chinese only).

### Deliverables

- `source.dj` — extracted/cleaned Chinese
- `target.dj` — English translation, line count matches source
- `bilingual.dj` — interleaved (source line, target line adjacent, blank between pairs)
- `edit-suggestions.dj` — terminology/consistency issues flagged for review

### Rules

1. Load `dharma-translation` and `terms-search` skills before starting.
2. Search terms DB with `search.py` for key Buddhist terms.
3. TOC: plain bullet lists, no link targets, no page numbers.
4. Djot formatting:
   - Emphasis: `*text*` (single asterisks). Never `**` (Markdown bold).
   - Comments: `{% ... %}`
   - Em dashes in English text: `---` (three hyphens). Pandoc converts to proper em dash in docx output.
   - En dashes in English text: `--` (two hyphens).
5. Preserve source formatting — don't add/remove emphasis.
6. Translate in-response — never call external translation APIs.

### Review

After translating, run `translation-review` skill (Workflow B) to check:
- Terminology consistency against terms DB
- Grammar, fluency, calques
- Missing content (mid-paragraph truncation)
- Inconsistency (same term translated differently)

---

## Workflow B: Proofread（校对）

Extract bilingual content from an existing DOCX manuscript and flag issues.
The DOCX already contains BOTH Chinese and English — the English is the
authoritative target, not something the agent creates.

### Input

A `.docx` manuscript with Chinese and English in parallel (typically
paragraph-level alternation: Chinese, blank, English, blank).

### Deliverables

- `bilingual.dj` — extracted from DOCX (interleaved)
- `edit-suggestions.dj` — mechanical/manuscript-level issues
- `translation-findings.dj` — translation quality issues (always produced)

### Extraction

1. `pandoc input.docx -f docx -t plain --wrap=none` to plain text
2. Script to extract CN/EN pairs. Write to `scripts/gen-bilingual-<name>-<hash>.py`.
   Copy the approach from an existing script (e.g. `gen-bilingual-buddhist-attitude.py`).
3. Write `bilingual.dj`.

### What to flag (edit-suggestions.dj)

Only flag objective/manuscript-level issues:

- **Garbled text** — merged duplicate edits in source DOCX
- **Double words** — `the The`, `is is`
- **Double punctuation** — `warm or cold..`
- **Numbering mismatches** — CN heading `三` vs EN heading `II`, or body heading
  number doesn't match TOC
- **Translator notes** — `（某某翻，某某审）` left in headings
- **Missing content** — paragraphs present in CN but missing in EN (or vice versa)
- **Duplicate text** — same name/phrase repeated (`岳麓书院岳麓书院`)
- **Capitalization typos** — `Philosopher Nietzsche` → `philosopher Nietzsche`
- **Stray/unusual characters** in either language

Do NOT flag translation quality issues here — those go to `translation-findings.dj`:

- Terminology choices, translation style, calques, fluency
- Djot formatting conventions (em-dashes, italics)
- Word order, added concepts, degree weakening

### Translation review (translation-findings.dj)

Always produced. Load `translation-review` skill after extraction, scan for:

- **Terminology** — key Buddhist terms rendered correctly
- **Content omission** — specific examples/explanations dropped
- **Added concepts** — words not in source (e.g. "creator" for 主宰)
- **Degree shifts** — 一切 → "many", weakening of claims
- **Terminology dilution** — technical terms rendered as literary paraphrase
- **Double renderings** — multiple translations of the same term side by side
- **Word order** — reversed logical sequence (e.g. 内圣外王)

---

## Djot

- Comments: `{% ... %}`
- Emphasis: `*text*` (single asterisks)
- Dashes in English: `---` em, `--` en. Pandoc converts in docx output.
- Preserve source formatting — don't add/remove emphasis

## Scripts

Utility scripts in `scripts/` (fish for CLI wrappers, Python for data processing).
Agents should write repetitive logic here and run via `terminal` rather than
regenerating the same Python in execute_code each turn.

- `scripts/docx2dj.fish <docx>` — pandoc .docx → .dj alongside the original
- `scripts/split-bilingual.fish <combined.dj>` — split into source.dj (CN) + target.dj (EN)
- `scripts/dj2docx.fish <target.dj>` — pandoc .dj → .docx in `/tmp/`
- `scripts/proofread-pdf.py <docx> <pdf>` — word-level diff between manuscript and typeset PDF
- `scripts/gen-bilingual.fish <dir>` — produce `bilingual.dj` from `source.dj` + `target.dj`
- `scripts/gen-bilingual-<name>-<hash>.py` — article-specific extraction from DOCX
