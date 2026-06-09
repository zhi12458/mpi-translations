# Terms Database Alignment

Batch-align translation glossary entries and body text against the MPI terms database.

## Setup

Start the HTTP API server if not running:
```
python3 /home/user/documents/mpi/terms-search/server.py &
```
Server listens on port 8910.

## Batch lookup pattern

Use Python via execute_code to query the API for multiple terms:

```python
import urllib.request, json, urllib.parse

terms = ["三无漏学", "八步三禅", "闻思修", ...]

for term in terms:
    q = urllib.parse.quote(term)
    resp = urllib.request.urlopen(f"http://localhost:8910/search?q={q}&limit=5", timeout=10)
    data = json.loads(resp.read())
    # Filter to authoritative sources
    author_sources = ["DoT定稿", "内部特色词", "佛教术语", "经论名"]
    relevant = [r for r in data["results"] if r["source"] in author_sources]
    # Compare against current translation, report mismatches
```

Or with curl:
```
curl -s "http://localhost:8910/search?q=三级修学&limit=5" | python3 -c "import sys,json; ..."
```

## Priority ranking

When the same term has entries in multiple source tables, prefer:
1. DoT定稿 (highest authority — final translation decisions)
2. 内部特色词 (MPI internal terminology)
3. 佛教术语 (general Buddhist terminology)
4. 经论名 (sutra/shastra titles)

## Alignment workflow

1. Extract all Chinese glossary terms from `{% "TERM" ... %}` blocks in the .dj file
2. Extract body-text domain terms that may not have glossary entries
3. Batch-query each term against the HTTP API
4. Filter results to authoritative source tables
5. Compare DB canonical translation against current file translation
6. Flag mismatches where DB entry differs materially from current
7. Apply fixes with `patch` tool — fix both glossary comments AND body text occurrences
8. Verify with `grep` that no old terms remain

## Pitfalls

- `replace_all` can create doubled words when the surrounding context already contains the replacement string (e.g., "The Eight Steps" → "The The Eight Steps"). Prefer targeted single-replacement patches.
- The `search.py` CLI does not support `src:` or `loc:` filters — use the HTTP API.
- Start patches from the bottom of the file upward to preserve line numbers.
- Some DB entries are contextual phrases (e.g., "珍惜法缘" → a full sentence), not standalone term translations. Use standalone term entries where available.
