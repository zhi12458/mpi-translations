---
name: dharma-translation
description: Translate Chinese↔English Buddhist/Dharma content using the MPI term database and Mindfulness Bell corpus for register guidance.
category: research
---

# Dharma Translation

When translating Chinese↔English Buddhist/Dharma content, consult TWO resources before producing output:

1. **Terms database** — for established term translations
2. **Mindfulness Bell corpus** — for register/style patterns in English Buddhist prose

## Resources

### Terms DB
- DB: `/home/user/documents/mpi/terms-search/termlib.duckdb`
- CLI: `/home/user/documents/mpi/terms-search/search.py <query>`
- Source tables priority: DoT定稿 > 内部特色词 > 佛教术语 > 经论名
- See `/home/user/documents/mpi/terms-search/SKILL.md` for full API details

### Mindfulness Bell Corpus
- Location: `/home/user/meta/www.files/public/The Mindfulness Bell/`
- 6 issues: MB92–MB97 (2023–2026), each ~84–116 pages
- Index: `index.yaml` (article titles, authors, pages)
- **Articles**: `~/documents/jingxin-lessons/Mindfulness Bell/articles/MB{92..97}/*.md` — 93 individual markdown files with YAML frontmatter. Read directly with `read_file`.
- Extraction script: `/tmp/extract_mb_articles.py` (re-run if PDFs change)

## Register Reference (from MB corpus analysis)

Four registers observed, useful as style targets:

| Register | Example | Key features |
|----------|---------|-------------|
| Dharma talk | Thầy (MB94 "Roses and Garbage", MB97 "Go as a River") | Short sentences, concrete images, coined terms ("interbeing"), oral address ("It's clear?"), Sanskrit kept with narrative explanation |
| Teaching lineage | Sister Đoan Nghiêm (MB93 "Our Patriarch Liễu Quán") | "We" voice, terms explained, cultural bridging ("like Jesus"), dates woven into narrative, still oral |
| Personal narrative | Mick McEvoy (MB94 "Touching the True Nature") | First-person, confessional, borrowed Dharma vocabulary, emotional directness, vernacular |
| Editorial | Brother Pháp Lưu (MB94 welcome letter) | Polished but warm, conceptual framing, "we" address |

## Translation Principles (observed from MB corpus)

1. **Terms**: Either keep Sanskrit w/ narrative explanation (bodhisattva, Māra) OR coin new English (interbeing, inter-are). Avoid clunky calques.
2. **Cultural bridging**: Add bridges for Western readers. A Chinese text mentioning 孔子 can stay; explain the function. Đoan Nghiêm's "like Jesus" is the pattern.
3. **Tone**: Chinese Dharma texts are typically more formal than English equivalents. Decide consciously: keep formality or warm up (Thầy style).
4. **Voice**: Direct address ("you"), concrete images, and oral rhythm make Dharma land in English. Abstract noun chains (common in Chinese→English translationese) kill it.
5. **Sutra quotes**: Use standard English Buddhist idiom. Check terse-idiom conventions (e.g., Diamond Sutra "lives" not "bodies").

## Workflow

1. Load both `terms-search` and `dharma-translation` skills (and `mpi-project-conventions` for output conventions)
2. For each key term in the source: search the terms DB first (HTTP API at port 8910)
3. For register decisions: consult the register table above (scanning MB articles is optional)
4. Translate directly — never call external translation APIs. Agent IS the model.
5. Write `target.dj` alongside `source.dj`. Match source line count exactly.
6. After translation, offer to align against the terms DB for verification

## MB Article Quick-Find

Common article types to search for register examples:
- Thầy's Dharma talks: search index for "Thích Nhất Hạnh" + page ≤ 10
- Sister/brother teachings: search for "Sister" or "Brother" + "DHARMA TEACHING"
- Personal narratives: first-person voice, often pages 8–60
- Lineage/history: "Patriarch," "ancestor," dates in text
