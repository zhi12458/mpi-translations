# Proofreading: Manuscript vs Typeset

## Two workflows

### A. Bilingual from DOCX (standard)

When the DOCX manuscript has both Chinese and English in 1:1 paragraph
correspondence, generate `bilingual.dj` directly from the DOCX:

1. `pandoc docx → plain text`
2. Extract Chinese-English pairs from body (Chinese line, blank, English line, blank)
3. Apply fixes: italicize Sanskrit on first occurrence, fix `N.Letter` → `N. Letter` spacing
4. Write bilingual.dj

The DOCX English is the authoritative target text. No PDF needed.

### B. Bilingual from PDF (when PDF is the typeset target)

When the PDF English is the typeset "final" version and should be the target:

1. Extract DOCX Chinese paragraphs (source)
2. Extract PDF body text via `pdftotext -layout`
3. Clean PDF: remove slug lines, headers, page numbers, join hyphenation breaks
4. Match DOCX English paragraphs against PDF body to find positions
5. Segment PDF body at matched positions
6. Write bilingual.dj with Chinese source + PDF English target

**Pitfalls in PDF extraction:**
- Consecutive hyphenation breaks (e.g. `thou-` + `sand...al-` + `leviate`) — the join
  loop must be recursive: after joining pair N, check if result still ends with `-`
  and join with line N+2
- Lines with leading whitespace: use `lstrip()` before checking `n[0].islower()`
- Drop-cap artifacts: `L iving` → `Living`
- Trailing section numbers: `...viewpoints. 1)` — the ` 1)` is a PDF section marker
  bleeding into the previous paragraph

### C. Edit suggestions (edit-suggestions.dj)

After generating bilingual.dj, scan for issues and write `edit-suggestions.dj`:

**Format**: follow the original document's section/chapter layout. Group suggestions
under the chapter headings where the issues occur. Use diff-style `-/+` notation.

**What to flag:**
- Garbled Chinese text (merged duplicate edits in source DOCX)
- Repeated words (`the The`)
- Chapter numbering mismatches (e.g. `九` ↔ `VIII`)
- Translator notes in headings (`（善鑫翻，妙一审）`)
- Missing quotes around dialogue/speech

## Common source DOCX issues

- Translator notes in Chinese headings: `（某某翻，某某审）` — delete for publication
- Merged duplicate edits: cut-paste errors where old+new text appear together
- `N.Letter` without space: `2.How` → `2. How`
- `the The` double article

## Sanskrit italicization

On first occurrence in body text, wrap with `*term*`. Track seen terms across
the full body. Terms: bodhisattva, bodhicitta, samsara, Dharma, karma, nirvana,
Sangha, sutra, Mahayana, Sravaka, Vinaya, Lamrim, Ksitigarbha, Samantabhadra,
Chan, Arhatship, Theravada.
