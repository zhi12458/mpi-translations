"""Generate bilingual.dj from DOCX for 「生命也可以被设计的」."""
import re, subprocess, os, hashlib

DOCX = "/home/user/documents/mpi/translate-files/生命也可以被设计的/中英文定稿-260324-生命也是可以被设计的-妙一宽山静雅初翻 慈鎏妙一审议 宽山定稿.docx"
OUT_DIR = "/home/user/documents/mpi/translate-files/生命也可以被设计的"

def has_cjk(s):
    return any('\u4e00' <= c <= '\u9fff' for c in s)

def pandoc(path):
    r = subprocess.run(['pandoc', path, '-f', 'docx', '-t', 'plain', '--wrap=none'],
                       capture_output=True, text=True)
    return r.stdout

def split_toc_line(line):
    """Split '  一、教育是为了育人 EDUCATION IS ABOUT NURTURING THE PERSON 3'
    into (cn, en). Split at CJK→ASCII uppercase boundary."""
    s = line.strip()
    # Remove trailing page number
    s = re.sub(r'\s+\d+\s*$', '', s)
    # Find boundary: last CJK char followed by space(s) + ASCII uppercase
    m = re.match(r'^(.+[\u4e00-\u9fff\u3000-\u303f\uff00-\uffef）\)])\s+([A-Z].+)$', s)
    if m:
        return m.group(1).strip(), m.group(2).strip()
    return None, None

def join_split_paragraphs(lines):
    """Join consecutive CJK lines that were split by page breaks.
    Only join when first line is long (>30 chars) to avoid joining headings."""
    result = []
    i = 0
    while i < len(lines):
        line = lines[i]
        s = line.strip()
        # Page-break splits happen in mid-paragraph; headings are short.
        # Only join when first line long AND doesn't end with terminal punctuation.
        long_and_abrupt = (s and has_cjk(s) and len(s) > 30
                           and not re.search(r'[。！？：）\u201d\u2019]$', s))
        if long_and_abrupt and i + 2 < len(lines) and lines[i+1].strip() == '' and has_cjk(lines[i+2]):
            result.append(line.rstrip() + lines[i+2].lstrip())
            i += 3
        else:
            result.append(line)
            i += 1
    return result

def extract_toc_entries(text):
    """Return (cn_entries, en_entries) lists from TOC area."""
    lines = text.split('\n')
    toc_start = None
    toc_end = None
    for i, l in enumerate(lines):
        s = l.strip()
        if s.startswith('一、') and ('EDUCATION' in s or 'NURTURING' in s):
            if toc_start is None:
                toc_start = i
        # TOC entries have page numbers at end
        if toc_start is not None and s and has_cjk(s) and re.search(r'\d+$', s):
            toc_end = i
        elif toc_start is not None and toc_end is not None and s and not re.search(r'\d+$', s) and has_cjk(s):
            break

    cn_entries = []
    en_entries = []
    for i in range(toc_start, toc_end + 1):
        s = lines[i]
        cn, en = split_toc_line(s)
        if cn and en:
            cn_entries.append(cn)
            en_entries.append(en)
    return cn_entries, en_entries

def extract_body_pairs(text):
    """Return [(cn, en), ...] pairs from body paragraphs and headings."""
    lines = text.split('\n')

    # Find body start: first Chinese paragraph after TOC
    body_start = None
    for i, l in enumerate(lines):
        if '现在是一个浮躁的时代' in l:
            body_start = i
            break

    # Join split paragraphs first
    pre = lines[:body_start]
    body = lines[body_start:]
    body = join_split_paragraphs(body)

    # Extract pairs: pattern is cn, blank, en, blank
    pairs = []
    i = 0
    while i < len(body):
        s = body[i].strip()
        if not s:
            i += 1
            continue
        if not has_cjk(s):
            i += 1
            continue
        # Chinese line found, look for English after blank
        en = ''
        if i + 2 < len(body) and body[i+1].strip() == '':
            ec = body[i+2].strip()
            if ec and not has_cjk(ec):
                en = ec
                i += 3
            else:
                i += 1
        else:
            i += 1
            continue
        pairs.append((s, en))
    return pairs

SANSKRIT = [
    'bodhisattva', 'bodhicitta', 'samsara', 'Dharma', 'karma',
    'nirvana', 'Sangha', 'sutra', 'Mahayana', 'Sravaka',
    'Vinaya', 'Lamrim', 'Ksitigarbha', 'Samantabhadra',
    'Chan', 'Arhatship', 'Theravada', 'buddha', 'Buddha',
    'buddhas', 'Buddhas', 'Bodhisattva', 'Bodhisattvas',
]

def apply_fixes(en_text, italicized):
    """Apply typesetting fixes to English text."""
    # Fix: "2.How" → "2. How"
    en_text = re.sub(r'(\d)\.([A-Z][a-z])', r'\1. \2', en_text)
    # Fix: "said,\"When → "said, \"When
    en_text = re.sub(r'(said|says),\"', r'\1, "', en_text)
    # Fix: "...understanding.Yet..." → "...understanding. Yet..."
    en_text = re.sub(r'\.([A-Z][a-z])', r'. \1', en_text)
    # Italicize Sanskrit on first occurrence
    for term in SANSKRIT:
        if term not in italicized:
            pattern = re.compile(r'\b' + re.escape(term) + r'\b')
            m = pattern.search(en_text)
            if m:
                s, e = m.start(), m.end()
                en_text = en_text[:s] + '*' + en_text[s:e] + '*' + en_text[e:]
                italicized.add(term)
    return en_text

def generate(toc_cn, toc_en, pairs, out_path):
    italicized = set()
    lines = []

    # Title
    lines.append('# 生命也是可以被设计的')
    lines.append('# Life Can Also Be Designed')
    lines.append('')
    lines.append('济群法师 2025年冬为母爱书院开示')
    lines.append('A teaching given by the Master Jiqun in the winter of 2025 at Amrita Retreat Center for Motherly Love Academy')
    lines.append('')

    # TOC
    for e in toc_cn:
        lines.append(f'- {e}')
    lines.append('')
    for e in toc_en:
        lines.append(f'- {e}')
    lines.append('')

    # Body
    for cn, en in pairs:
        en_fixed = apply_fixes(en, italicized)
        lines.append(cn)
        lines.append(en_fixed)
        lines.append('')

    with open(out_path, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Written: {out_path}")
    print(f"  TOC entries: {len(toc_cn)}")
    print(f"  Body pairs: {len(pairs)}")
    print(f"  Sanskrit italicized: {sorted(italicized)}")

if __name__ == '__main__':
    print("Extracting DOCX...")
    text = pandoc(DOCX)

    print("Extracting TOC...")
    toc_cn, toc_en = extract_toc_entries(text)
    for cn, en in zip(toc_cn, toc_en):
        print(f"  {cn}  →  {en}")

    print("Extracting body...")
    pairs = extract_body_pairs(text)
    print(f"  Pairs: {len(pairs)}")

    out = os.path.join(OUT_DIR, 'bilingual.dj')
    generate(toc_cn, toc_en, pairs, out)
