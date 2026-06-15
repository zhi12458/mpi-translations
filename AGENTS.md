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

## Translation Workflow

1. Load `dharma-translation` and `terms-search` skills
2. Search terms DB with `search.py` for key terms before translating
3. Translate directly — agent IS the model, no external APIs
4. Write `target.dj`, match source line count exactly
5. TOC: bullet list, no link targets. No page numbers.
6. Create `bilingual.dj` (interleave source/target lines)

## Djot

- Comments: `{% ... %}`
- Dashes: `---` em, `--` en. Pandoc converts in docx output.
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
