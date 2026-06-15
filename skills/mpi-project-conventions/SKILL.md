---
name: mpi-project-conventions
description: Use when working in the MPI project (~/documents/mpi) — translation skill management, terms database, djot conventions, and skill relocation workflow.
---

# MPI Project Conventions

Project directory: `/home/user/documents/mpi/`

## Skill management

Translation-related skills live in `./skills/` (canonical source). Hermes discovers
them via `skills.external_dirs` in `~/.hermes/config.yaml`:

```yaml
skills:
  external_dirs:
  - /home/user/documents/mpi/skills
```

Set with: `hermes config set skills.external_dirs '[/home/user/documents/mpi/skills]'`

Pitfall: `hermes config set` stringifies list values. After running it, verify the
YAML has proper list syntax (`- /path`, not `'[/path]'`). Edit manually if needed.

The old symlink approach (`~/.hermes/skills/dharma-translation` → `./skills/`) is
deprecated. `skills/install.fish` has been replaced by `skills/readme.dj`.

## Terms database

- **Module (preferred)**: `from search import search` — call directly in `execute_code` scripts.
  `search("空性", limit=5, loc="...", src="DoT定稿")` → list of `{zh, en, loc, source}` dicts.
  No subprocess, no text parsing. Import after `sys.path.insert(0, '/home/user/documents/mpi/terms-search')`.
- CLI: `/home/user/documents/mpi/terms-search/search.py <query> [limit]`
- Server: `terms-search/server.py` (Flask, port 8910) — use only when module/CLI is insufficient
- Start: `python3 /home/user/documents/mpi/terms-search/server.py &`
- Query: `http://localhost:8910/search?q=...`

## Djot conventions

- Comments use `{% ... %}` syntax
- Emphasis: `*text*` (single asterisks). `**text**` is Markdown, NOT Djot — never use it.
- Em dashes: `---` (three hyphens in English text). Pandoc converts to proper em dash in docx output.
- En dashes: `--` (two hyphens). Pandoc converts to proper en dash in docx output.
- Preserve source formatting level exactly: if the source has no emphasis on a label, the translation must have none. Do not add or remove formatting.
- TOC in both `source.dj` and `target.dj`: use clean bullet lists (`- *Section*` / `  - N．item`), not `[text](#anchor)` link markup. Those links are pandoc markdown artifacts. Both files should use the same TOC format.
- Bilingual files: create `bilingual.dj` alongside `source.dj` and `target.dj`. No new 对照.dj files — existing ones in old projects are artifacts, don't delete them. Generate with `fish scripts/gen-bilingual.fish <article-dir>`. Format: see Bilingual file format section below.

### Markdown → Djot conversion (pandoc)

```bash
pandoc input.md -f markdown -t djot --wrap=none -o output.dj
```

Pitfall: pandoc strips `{#id}` attributes from headings but leaves behind stray
`{#...}` lines. Pre-strip heading anchors from the markdown before conversion:

```bash
sed 's/ {#[^}]*}//g' input.md | pandoc -f markdown -t djot --wrap=none -o output.dj
```

Follow up by removing any remaining standalone `{#...}` lines from the djot output:

```bash
sed -i '/^{#.*}$/d' output.dj
```

Pitfall — combined documents: When the source `.docx.md` contains multiple articles,
the TOC at the top often covers all articles. After splitting into per-article
`source.dj` files, verify each TOC only lists headings that belong to that article.
Remove entries for sibling articles — the combined TOC is a print-document artifact.

### Bilingual file format (bilingual.dj)

Structure: interleave Chinese source and English target paragraph-by-paragraph.

**Preferred workflow**: when the DOCX manuscript has both languages in 1:1\ncorrespondence, extract directly from DOCX. No PDF needed — the DOCX English IS\nthe target. Adapt `scripts/gen-bilingual-docx.py` as a starting point.\n\nPitfall: DOCX manuscripts sometimes order CN content before EN content within a\nsection (CN heading → CN body → EN heading → EN body) rather than strict\nCN→EN→CN→EN alternation. The simple extraction in `gen-bilingual-docx.py` fails\nfor these. Use block-based extraction instead — see\n`references/proofreading-patterns.md` for the approach.

**Title & subtitle**: adjacent pair (source, target, no blank between), then a single blank line before the next pair.

**TOC**: source TOC block, blank line, target TOC block — NOT interleaved line-by-line.

**Body**: source line, target line (adjacent — NO blank between them), then a single blank line between pairs.

Pitfall: do NOT put a blank between source and target within a body pair.

**Edit suggestions**: after generating bilingual.dj, scan for issues (garbled text,
numbering mismatches, translator notes, repeated words) and write
`edit-suggestions.dj`. Follow the original document's section layout — group
suggestions under chapter headings, not by issue type. Use diff `-/+` notation.

## Translation skills

Skills tracked in this project:
- `terms-search` — full-text search across the MPI term database
- `translation-review` — review CN↔EN translations (CSV/XLSX + .dj comparison)
- `pptx-translate` — translate PowerPoint files
- `dharma-translation` — translate Buddhist Dharma talks
- `chinese-text-normalize` — normalize Chinese markdown line breaks
- `pdf-to-docx-conversion` — convert PDFs to DOCX with layout preservation

See `references/meditation-translation.md` for lighter workflow when translating
guided meditation / mindfulness exercise content (vs. Dharma talks).

See `references/translation-pitfalls.md` for recurring CN→EN mistranslation patterns
(关爱→compassion, 生生增上, 因病返贫, 生存层面, etc.) — review this before starting
any translation review.

See `references/markdown-to-djot.md` for converting `.docx.md` source files to djot,\nincluding splitting combined articles and cleaning pandoc heading anchors.\n\nSee `references/proofreading-patterns.md` for common manuscript-vs-typeset\ndifferences (term substitutions, numbering changes, typesetting artifacts in\npdftotext output) and the bilingual-from-PDF workflow.

## Utility scripts

Project scripts live in `~/documents/mpi/scripts/`. Write them in fish shell for
CLI wrappers, Python for data processing.

**Naming**: generic reusable scripts get descriptive names (`dj2docx.fish`,
`proofread-pdf.py`). Article-specific one-off scripts use `<name>-<hash>.<ext>`
to signal they're not general-purpose. Don't name a single-article script as if
it were reusable.

**Agent workflow**: when doing repetitive Python processing (text extraction,
diffing, data transforms), write the logic to a script in `scripts/` and run it
via `terminal`. Don't regenerate the same Python in `execute_code` across turns.
This keeps the agent's output concise — the user sees the results, not the code.

- `dj2docx.fish` — convert `target.dj` → `/tmp/<dirname>-英文.docx` via pandoc.
  Usage: `fish scripts/dj2docx.fish <path-to-target.dj>`
- `proofread-pdf.py <docx> <pdf>` — compare manuscript DOCX against typeset PDF.
- `gen-bilingual-docx.py` — template for generating `bilingual.dj` directly from DOCX manuscript.
  Adapt for each article by changing paths and article-specific metadata.
  For articles with mixed CN→EN ordering, use block-based extraction instead
  of simple alternation (see `references/proofreading-patterns.md`).
- `gen-bilingual.fish <article-dir>` — generate `bilingual.dj` from `source.dj` + `target.dj`.
