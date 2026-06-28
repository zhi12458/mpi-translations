// MPI Bilingual Chinese-English Template
// ============================================================
// A simple Typst template for bilingual Chinese-English Buddhist
// texts, matching the 静心学堂丛书 formatting guide.
//
// Fonts (all available from Google Fonts):
//   - Chinese body: Noto Serif CJK SC
//   - English body:  Noto Serif  (Times New Roman substitute)
//
// Format highlights:
//   - Body size: 10.5pt (Chinese 五号)
//   - Line spacing: 1.5em
//   - Justified body text with 2em first-line indent
//   - Headings unnumbered, with 1.2em block spacing
//   - Footnotes in 8pt, left aligned
// ============================================================

#let chinese-font = "Noto Serif CJK SC"
#let english-font = "Noto Serif"

// Convert any content to a plain string.
#let to-string(content) = {
  if type(content) == str {
    content
  } else if content.func() == text {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else {
    ""
  }
}

// Return true if the content is primarily Chinese.
#let is-chinese(content) = {
  let txt = to-string(content)
  let cn-re = regex("[\u{4e00}-\u{9fff}]")
  let en-re = regex("[A-Za-z]")
  for c in txt.clusters() {
    if c.match(cn-re) != none { return true }
    if c.match(en-re) != none { return false }
  }
  false
}

// Bilingual table of contents.
// Only English headings show dotted leaders and page numbers;
// Chinese headings are shown compactly as section headers.
#let toc() = context {
  let indent-per-level = 1.5em
  for h in query(heading.where(outlined: true)) {
    let cn = is-chinese(h.body)
    block(
      inset: (left: (h.level - 1) * indent-per-level),
      above: if cn { 0.3em } else { 0.7em },
      below: if cn { 0.7em } else { 1.2em },
      {
        if cn {
          h.body
        } else {
          let page-num = counter(page).at(h.location()).first()
          h.body + box(width: 1fr, repeat[.]) + str(page-num)
        }
      }
    )
  }
}

// Document class.
//
// title-cn, title-en, subtitle-cn, subtitle-en accept free Typst content.
// The template centers them and applies only size/weight; the global font
// stack handles Chinese vs English glyphs.
#let mpi-bilingual(
  title-cn: none,
  title-en: none,
  subtitle-cn: none,
  subtitle-en: none,
  show-toc: true,
  body,
) = {
  // Base text: Chinese font first, then English fallback.
  set text(font: (chinese-font, english-font), size: 10.5pt, lang: "zh")

  // A4 page with 2.5cm margins.
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    numbering: "1",
  )

  // Body paragraphs: justified, 1.5 line spacing, 2em first-line indent,
  // with a blank line's worth of space between paragraphs.
  set par(justify: true, leading: 1.5em, spacing: 1.5em, first-line-indent: (amount: 2em, all: true))

  // Headings: no numbering, bold, with generous block spacing.
  set heading(numbering: none)
  show heading: it => block(above: 2em, below: 1.2em, it.body)

  // Footnotes: 8pt, left aligned.
  show footnote: set text(size: 8pt)
  set footnote.entry(indent: 0pt)

  // Title page.
  align(center)[
    #set par(leading: 1.5em, spacing: 0pt)
    #if title-cn != none {
      text(size: 1.4em, weight: "bold")[#title-cn]
    }
    #if subtitle-cn != none {
      linebreak()
      subtitle-cn
    }
    #v(1.5em)
    #if title-en != none {
      text(size: 1.2em, weight: "bold")[#title-en]
    }
    #if subtitle-en != none {
      linebreak()
      subtitle-en
    }
  ]

  v(2.5em)

  // Table of contents.
  if show-toc {
    align(center)[#text(size: 1.2em)[目录 / Contents]]
    v(0.8em)
    toc()
    pagebreak()
  }

  // Main body.
  body
}
