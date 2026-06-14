# MPI Project Conventions

## Skills

MPI skills live in `skills/` and are loaded via `~/.hermes/config.yaml`:

```yaml
skills:
  external_dirs:
  - /home/user/documents/mpi/skills
```

Available skills: `terms-search`, `dharma-translation`, `translation-review`, `chinese-text-normalize`, `pptx-translate`, `pdf-to-docx-conversion`.

{% `hermes config set` stringifies list values — edit config.yaml directly for proper YAML list syntax. %}

## Terms Database

- DB: `terms-search/termlib.duckdb`
- CLI: `terms-search/search.py <query> [limit]`
- Source priority: DoT定稿 > 内部特色词 > 佛教术语 > 经论名

## Translation Workflow

1. Load `dharma-translation` and `terms-search` skills
2. Search terms DB for key terms before translating
3. Translate directly (agent IS the model — no external translation APIs)
4. Write `target.dj` alongside `source.dj`, matching source line count
5. TOC: bullet list, no link targets

## Djot Conventions

- Comments: `{% ... %}`
- Em dashes in English: three hyphens (`---`)
- En dashes in English: two hyphens (`--`)
- No `对照.dj` files — don't create or delete them
- Translation formatting: preserve source formatting exactly

## Scripts

Fish shell. Live in `scripts/`.
