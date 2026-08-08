#!/usr/bin/env python3
"""Build bilingual.html — an HTML recreation of the original PDF design
(第22课 传递善意，点亮心灯, MPI Personal Lamp-Transmission Practice Course).

Reads source.dj + target.dj (1:1 line parity) and emits HTML page frames that
recreate the original 8-page PDF layout: cover, running header with MPI logo,
wave-band footer with page numbers, blue #0066FF x.y labels, and the
social-media table with the WhatsApp QR-card strip image.

Usage: python3 build-html.py
Output: bilingual.html (open in browser; print via browser for PDF)
"""

import html
import re
from pathlib import Path

HERE = Path(__file__).parent

src_lines = (HERE / "source.dj").read_text(encoding="utf-8").splitlines()
tgt_lines = (HERE / "target.dj").read_text(encoding="utf-8").splitlines()
assert len(src_lines) == len(tgt_lines), "source/target line parity broken"

BLUE = "#0066FF"  # sampled from PDF: x.y numbered item labels

# Page assignment by source line number (matches the original PDF pagination).
# Pages 2→3 and 5→6 split a paragraph mid-way; split points are below.
PAGES = {
    2: [5, 7, 9, 11, 13, 15, ("17a", 17)],
    3: [("17b", 17), 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41],
    4: [43, 45, 59, 61, 63, 65],
    5: [67, 69, 71, 73, 75, 77, 79, 81, 83, ("85a", 85)],
    6: [("85b", 85), 87, 89, 91, 93, 95, 97, 99, 101, 103, 105,
        107, 109, 111, 113, 115, 117, 119, 121],
    7: [123, 125, 127, 129, 131, 133, 135, 137, 139, 141],
    8: [143, 145, 147, 149],
}

# Mid-paragraph split points (PDF layout artifacts, char prefixes).
SPLITS = {
    "17a": ("如何帮助更多人点亮心灯？过去几十年，我们在弘法过程中探索了很多经验，希望大家参",
            "How can we help more people light the inner lamp? Over the past decades, we have explored and gathered a wealth of experience in spreading the Dharma, and we hope everyone"),
    "17b": ("与其中，让智慧文化走进千家万户。",
            " will take part, bringing the culture of wisdom into thousands upon thousands of households."),
    "85a": ("2.3 推广安心茶室，走进千家万户。主动分享自己打造安心茶室的经验给身边人，帮助有条件",
            "2.3 Promote the Dhyana Tea Space so it enters thousands upon thousands of households. Take the initiative to share your experience of creating a Dhyana Tea Space with the people around you, and help those with the means"),
    "85b": ("的人打造家庭安心茶室；也可以通过网络自媒体，或者走进社团、社区等团体，把安心茶室文化分享给更多人，帮助更多人打造安心茶室，推动安心茶室走进千家万户。",
            " create home Dhyana Tea Spaces of their own; you can also use social media, or go into associations and community groups, to share the Dhyana Tea Space culture with more people, help more people create Dhyana Tea Spaces, and bring the Dhyana Tea Space into thousands upon thousands of households."),
}

# Table rows: source lines 45-57 (pipe table). WhatsApp row (57) becomes the QR image.
TABLE_SRC_ROWS = list(range(45, 58))


def esc(s):
    return html.escape(s, quote=False)


def inline_djot(s):
    """Minimal djot inline: *emphasis* -> <em>."""
    s = esc(s)
    return re.sub(r"\*([^*]+)\*", r"<em>\1</em>", s)


def classify(cn):
    if cn.startswith("### "):
        return "sub", cn[4:]
    if cn.startswith("## "):
        return "sec", cn[3:]
    if re.match(r"^\d+\.\d+", cn):
        return "xy", cn
    if re.match(r"^\d+\.\s", cn):
        return "item", cn
    if cn == "静心生态社媒传播一览表":
        return "tabtitle", cn
    return "body", cn


def emit_pair(cn, en, part=None):
    """Emit one CN/EN pair with the right class."""
    if part:
        cn, en = SPLITS[part]
    kind, text = classify(cn)
    out = []
    if kind == "sec":
        out.append(f'<h2>{inline_djot(text)}</h2>')
        out.append(f'<p class="en en-head">{inline_djot(en.lstrip("# "))}</p>')
    elif kind == "sub":
        out.append(f'<h3>{inline_djot(text)}</h3>')
        out.append(f'<p class="en en-head">{inline_djot(en.lstrip("# "))}</p>')
    elif kind == "item":
        out.append(f'<h4>{inline_djot(text)}</h4>')
        out.append(f'<p class="en en-head">{inline_djot(en)}</p>')
    elif kind == "xy":
        # Blue bold label: "x.y ...。" prefix; rest black body.
        m = re.match(r"^(\d+\.\d+\s[^。]*。)(.*)$", cn)
        if m:
            cn_html = f'<span class="bl">{inline_djot(m.group(1))}</span>{inline_djot(m.group(2))}'
        else:
            cn_html = f'<span class="bl">{inline_djot(cn)}</span>'
        m2 = re.match(r"^(\d+\.\d+\s[^.]*\.)(.*)$", en)
        if m2 and m:
            en_html = f'<span class="bl">{inline_djot(m2.group(1))}</span>{inline_djot(m2.group(2))}'
        else:
            en_html = f'<span class="bl">{inline_djot(en)}</span>' if not m else inline_djot(en)
        out.append(f'<p class="xy">{cn_html}</p>')
        out.append(f'<p class="en">{en_html}</p>')
    elif kind == "tabtitle":
        out.append(f'<p class="tabtitle">{inline_djot(text)}</p>')
        out.append(f'<p class="en en-tabtitle">{inline_djot(en)}</p>')
    else:
        cls = ' class="cont"' if part and part.endswith("b") else ""
        out.append(f'<p{cls}>{inline_djot(cn)}</p>')
        out.append(f'<p class="en">{inline_djot(en)}</p>')
    return "\n".join(out)


def emit_table():
    """Render the pipe table (lines 45-56); line 57 -> QR strip image.

    Each cell shows CN on the first line and EN below (muted). The first
    column uses rowspan like the merged cells in the original PDF."""
    rows = []
    for ln in TABLE_SRC_ROWS[:-1]:
        src, tgt = src_lines[ln - 1], tgt_lines[ln - 1]
        if re.match(r"^\|[-\s|]+\|$", src):
            continue  # separator row
        cells_src = [c.strip() for c in src.strip().strip("|").split("|")]
        cells_tgt = [c.strip() for c in tgt.strip().strip("|").split("|")]
        rows.append((cells_src, cells_tgt))

    # Compute first-column spans: a non-empty cell spans until the next non-empty one.
    spans = {}
    run_start = None
    for i in range(1, len(rows)):
        if rows[i][0][0]:
            if run_start is not None:
                spans[run_start] = i - run_start
            run_start = i
    if run_start is not None:
        spans[run_start] = len(rows) - run_start

    def cell(tag, c_cn, c_en, attrs=""):
        inner = inline_djot(c_cn)
        if c_en and c_en != c_cn:
            inner += f'<br><span class="en-cell">{inline_djot(c_en)}</span>'
        return f"<{tag}{attrs}>{inner}</{tag}>"

    out = ['<table>']
    for i, (cs, ct) in enumerate(rows):
        tag = "th" if i == 0 else "td"
        out.append("<tr>")
        for j, c in enumerate(cs):
            if j == 0:
                if i in spans:
                    out.append(cell(tag, c, ct[j], f' rowspan="{spans[i]}"'))
                elif i == 0:
                    out.append(cell(tag, c, ct[j]))
                # else: covered by rowspan
            else:
                out.append(cell(tag, c, ct[j]))
        out.append("</tr>")
    out.append("</table>")
    out.append('<figure class="qr"><img src="media/whatsapp-qr-cards.png" '
               'alt="济群法师与国际静心协会 WhatsApp 频道二维码卡片（中英双语各一） / QR-code cards for the Master Jiqun and Mindful Peace International WhatsApp channels"></figure>')
    out.append('<p class="en qr-cap">QR-code cards for the Master Jiqun and Mindful Peace International WhatsApp channels (one in Chinese and one in English for each)</p>')
    return "\n".join(out)


def header():
    return ('<div class="runhead"><img class="logo" src="media/mpi-logo.png" alt="Mindful Peace International">'
            '<span class="rhtitle">MPI 个人传灯实践课</span></div>')


def footer(n):
    return (f'<div class="foot"><img class="wave" src="media/wave-band.png" alt="">'
            f'<span class="pageno">{n}</span></div>')


def page(n, inner):
    return f'<section class="page">{header()}<main>{inner}</main>{footer(n)}</section>'


def cover():
    return f'''<section class="page cover">
  <img class="coverbg" src="media/cover-bg.png" alt="">
  <img class="logo cover-logo" src="media/mpi-logo.png" alt="Mindful Peace International">
  <div class="cover-title">
    <h1>{esc(src_lines[0])}</h1>
    <p class="cover-sub">{esc(src_lines[2].lstrip("-"))}</p>
    <p class="cover-sub en-title">{esc(tgt_lines[0])}</p>
    <p class="cover-sub en-title en-course">{esc(tgt_lines[2].lstrip("-"))}</p>
  </div>
</section>'''


parts = [cover()]
for n, items in PAGES.items():
    blocks = []
    for it in items:
        if isinstance(it, tuple):
            part, ln = it
            blocks.append(emit_pair(src_lines[ln - 1], tgt_lines[ln - 1], part=part))
        elif it == 45:
            blocks.append(emit_table())
        else:
            blocks.append(emit_pair(src_lines[it - 1], tgt_lines[it - 1]))
    parts.append(page(n, "\n".join(blocks)))

CSS = f"""
* {{ margin: 0; padding: 0; box-sizing: border-box; }}
body {{ background: #e8edf3; font-family: "Noto Sans CJK SC", "Source Han Sans SC",
       "Microsoft YaHei", "PingFang SC", sans-serif; color: #000; }}
.page {{ position: relative; width: 210mm; min-height: 297mm; margin: 28px auto;
        background: #fff; box-shadow: 0 2px 12px rgba(0,0,0,.18);
        padding: 22mm 17mm 34mm; overflow: hidden; }}
.runhead {{ display: flex; align-items: flex-end; justify-content: space-between;
           border-bottom: 1.5px solid #000; padding-bottom: 3mm; margin-bottom: 10mm; }}
.logo {{ height: 12mm; }}
.rhtitle {{ font-size: 13pt; font-weight: bold; }}
.foot {{ position: absolute; left: 0; right: 0; bottom: 0; }}
.wave {{ width: 100%; display: block; }}
.pageno {{ position: absolute; right: 17mm; bottom: 8mm; font-size: 10pt; color: #333; }}

.cover {{ padding: 0; }}
.coverbg {{ position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; }}
.cover-logo {{ position: absolute; top: 12mm; left: 14mm; height: 15mm; }}
.cover-title {{ position: absolute; top: 26%; width: 100%; text-align: center; }}
.cover-title h1 {{ font-size: 30pt; font-weight: bold; letter-spacing: .02em; }}
.cover-sub {{ margin-top: 6mm; font-size: 15pt; font-weight: bold; }}
.en-title {{ color: #2a4a66; font-weight: normal; }}
.en-course {{ margin-top: 2mm; font-size: 12pt; }}

h2 {{ font-size: 15.5pt; margin: 7mm 0 4mm; }}
h3 {{ font-size: 13.5pt; margin: 6mm 0 3mm; }}
h4 {{ font-size: 12.5pt; margin: 5mm 0 2.5mm; }}
main p {{ font-size: 11.5pt; line-height: 1.95; text-align: justify; margin: 0 0 2.2mm; }}
main p:not(.en):not(.xy):not(.tabtitle) {{ text-indent: 2em; }}
main p.cont {{ text-indent: 0; }}
main p.xy {{ text-indent: 0; }}
.bl {{ color: {BLUE}; font-weight: bold; }}
p.en {{ font-size: 10pt; line-height: 1.6; color: #43596e; text-indent: 0;
       margin: -1.2mm 0 4mm; font-family: Georgia, "Times New Roman", serif; }}
p.en-head {{ font-style: italic; }}
.tabtitle {{ text-align: center; font-weight: bold; font-size: 12.5pt; margin: 6mm 0 2mm; text-indent: 0; }}
.en-tabtitle {{ text-align: center; }}

table {{ border-collapse: collapse; width: 100%; margin: 2mm 0 1mm; font-size: 10pt; }}
th, td {{ border: 1px solid #9dc3e6; padding: 2.2mm 3mm; text-align: left; }}
th {{ background: #deeaf6; color: #1f4e79; }}
.en-cell {{ color: #43596e; font-size: 8.5pt; font-weight: normal;
           font-family: Georgia, "Times New Roman", serif; }}
td:first-child {{ color: #1f4e79; font-weight: bold; }}
figure.qr {{ margin: 2mm 0 1mm; }}
figure.qr img {{ width: 100%; border: 1px solid #9dc3e6; }}
p.qr-cap {{ text-align: center; margin-top: 0; }}

@media print {{
  body {{ background: #fff; }}
  .page {{ margin: 0; box-shadow: none; page-break-after: always; }}
}}
"""

doc_html = f"""<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>{esc(src_lines[0])} · {esc(tgt_lines[0])}</title>
<style>{CSS}</style>
</head>
<body>
{chr(10).join(parts)}
</body>
</html>
"""

(HERE / "bilingual.html").write_text(doc_html, encoding="utf-8")
print(f"wrote bilingual.html ({len(doc_html)} bytes)")
