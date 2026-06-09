---
name: terms-search
description: Full-text search across the MPI term database. Use when translating or looking up Chinese-English Buddhist/MPI terminology.
category: research
---

# Terms Search

Database: `/home/user/documents/mpi/terms-search/termlib.duckdb`
CLI: `/home/user/documents/mpi/terms-search/search.py`

## Search

```
terms-search <query> [limit]
terms-search <query> loc:<source>      # filter by 出处
terms-search <query> src:<table>       # filter by source table
terms-search src:<table>              # list all from table
```

Multi-word queries are ANDed. Searches both `zh` and `en` columns.

## Source tables

| src | rows | description |
|---|---|---|
| BAICKZ | 7,679 | Main term bank with example sentences |
| 佛教术语 | 1,795 | Buddhist terminology from 定稿书目术语库 |
| DoT定稿 | 896 | DoT final translation decisions |
| DoT初步 | 412 | DoT preliminary queries |
| 偈颂经文名言 | 263 | Verses and sutra quotes |
| 成语俗语 | 184 | Idioms and common expressions |
| 经论名 | 89 | Sutra/shastra titles |
| 内部特色词 | 87 | MPI internal terminology |
| 海内外建筑名称 | 28+9 | MPI building/place names |
| MPI组织架构 | 4+28 | MPI org structure |
| 导师金句 | 24 | Teacher quotes |
| 静心学堂课程 | 17+20 | Course names |
| 禅意项目 | 14+11 | Zen program terms |
| 公案 | 8 | Chan koans |

## Direct DuckDB

```
duckdb /home/user/documents/mpi/terms-search/termlib.duckdb
```

Key tables: `unified_terms_flat` (zh, en, loc, source), individual source tables, `unified_terms` view.

## Rebuilding

Terms data comes from `/home/user/documents/mpi/guide/03 术语库/`. To rebuild:
1. Convert source xlsx/ods → CSV+YAML in `_output/` (see `/tmp/convert_sheets3.py`)
2. Rebuild DuckDB from CSVs (see `/tmp/duckdb_import.py` and `/tmp/fix_dot.py`)
3. Materialize `unified_terms_flat` view → table for performance
