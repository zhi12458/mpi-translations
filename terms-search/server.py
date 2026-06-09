#!/usr/bin/env python3
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import duckdb
from flask import Flask, request, jsonify, render_template_string
import search as s

app = Flask(__name__)

HTML = r'''<!DOCTYPE html>
<meta charset="utf-8">
<title>静心学堂中英文翻译对照表</title>
<h1>静心学堂（非官方）中英文翻译对照表</h1>
<form method="get">
  <input name="q" value="{{ q }}" placeholder="query (e.g. 空性 emptiness)">
  <input name="loc" value="{{ loc }}" placeholder="loc filter">
  <input name="src" value="{{ src }}" placeholder="src filter">
  <input name="limit" value="{{ limit }}" size="4" placeholder="limit">
  <button type="submit">Search</button>
</form>

{% if searched %}
{% if error %}<p>Error: {{ error }}</p>
{% else %}
<p>{{ count }} results</p>
<table border="1" cellpadding="4" cellspacing="0">
  <tr><th>ZH</th><th>EN</th><th>LOC</th><th>SRC</th></tr>
  {% for r in results %}
  <tr>
    <td>{{ r.zh }}</td>
    <td>{{ r.en }}</td>
    <td>{{ r.loc or '' }}</td>
    <td>{{ r.source }}</td>
  </tr>
  {% endfor %}
</table>
{% endif %}
{% endif %}
'''

def do_search(q, loc, src, limit):
    with duckdb.connect(s.DB, read_only=True) as con:
        rows = s.search(con, q, loc, src, limit)
    return [{'zh': r[0], 'en': r[1], 'loc': r[2] or None, 'source': r[3]} for r in rows]

@app.route('/search')
def search():
    try:
        q = request.args.get('q', '')
        loc = request.args.get('loc')
        src = request.args.get('src')
        limit = request.args.get('limit', type=int)
        results = do_search(q, loc, src, limit)
        return jsonify({'count': len(results), 'results': results})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/sources')
def sources():
    try:
        with duckdb.connect(s.DB, read_only=True) as con:
            rows = con.execute(
                'SELECT source, COUNT(*) AS cnt FROM unified_terms_flat GROUP BY source ORDER BY cnt DESC'
            ).fetchall()
        return jsonify([{'source': r[0], 'count': r[1]} for r in rows])
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/')
def ui():
    q = request.args.get('q', '')
    loc = request.args.get('loc', '')
    src = request.args.get('src', '')
    limit = request.args.get('limit', '')
    searched = bool(request.args)
    results = []
    count = 0
    error = None
    if searched and (q or loc or src):
        try:
            lim = int(limit) if limit else None
            results = do_search(q, loc or None, src or None, lim)
            count = len(results)
        except Exception as e:
            error = str(e)
    return render_template_string(HTML, q=q, loc=loc, src=src, limit=limit,
                                  searched=searched, results=results, count=count, error=error)

if __name__ == '__main__':
    app.run(port=8910)
