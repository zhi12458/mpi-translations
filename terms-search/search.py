#!/usr/bin/env python3
"""Full-text search over MPI term database. Queries unified_terms_flat via DuckDB LIKE."""
import sys, os
import duckdb

DB = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'termlib.duckdb')

def search(con, query, loc_filter=None, src_filter=None, limit=None):
    terms = query.split()
    clauses = []
    params = []

    for t in terms:
        like = f'%{t}%'
        clauses.append('(zh LIKE ? OR en LIKE ?)')
        params.extend([like, like])

    where = ' AND '.join(clauses) if clauses else '1=1'

    if loc_filter:
        where += ' AND loc LIKE ?'
        params.append(f'%{loc_filter}%')
    if src_filter:
        where += ' AND source = ?'
        params.append(src_filter)

    sql = f'SELECT zh, en, loc, source FROM unified_terms_flat WHERE {where}'
    if limit is not None:
        sql += ' LIMIT ?'
        params.append(limit)

    return con.execute(sql, params).fetchall()

def main():
    if len(sys.argv) < 2:
        print("Usage: terms-search <query> [limit]")
        print("  queries: '空性', 'emptiness 中观'")
        print()
        print("Special prefixes (can be standalone or combined with query):")
        print("  loc:<source>  — filter by loc (e.g. loc:心经)")
        print("  src:<table>   — filter by source table (e.g. src:佛教术语)")
        print()
        print("Examples:")
        print("  terms-search 空性")
        print("  terms-search 'suffering 苦' loc:心经")
        print("  terms-search src:公案")
        sys.exit(1)

    raw = sys.argv[1]
    limit = int(sys.argv[2]) if len(sys.argv) > 2 else 20

    # Parse prefixes
    loc_filter = None
    src_filter = None
    query_parts = []

    for token in raw.split():
        if token.startswith('loc:'):
            loc_filter = token[4:]
        elif token.startswith('src:'):
            src_filter = token[4:]
        else:
            query_parts.append(token)

    query = ' '.join(query_parts)

    con = duckdb.connect(DB, read_only=True)

    if not query and not loc_filter and not src_filter:
        print("No search terms or filters. Usage: terms-search <query> [limit]")
        return

    rows = search(con, query, loc_filter, src_filter, limit)

    if not rows:
        print(f"No results for: {raw}")
        return

    print(f"Results: {len(rows)}")
    print()
    for zh, en, loc, src in rows:
        print(f'zh: {zh}')
        print(f'en: {en}')
        print(f'loc: {loc or "-"}  |  src: {src}')
        print()

    con.close()

if __name__ == '__main__':
    main()
