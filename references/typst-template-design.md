# MPI Bilingual Typst Template — Design Decisions

## Location

- Repo / project root: `~/documents/mpi/`
- Template directory (contains `lib/`): `~/documents/mpi/translate-files/`
- Template: `translate-files/lib/mpi-bilingual-template.typ`
- Example usage: `translate-files/从物品整理到心灵整理/mindful-organizing.typ`

## Goal

A single reusable Typst template for bilingual Chinese-English 静心学堂丛书
publications. Host `.typ` files should contain almost no setup code — only an
`#import`, a `#show: mpi-bilingual.with(...)` call, and the article content.

## Font choice

- **Chinese:** Noto Serif CJK SC (Google Fonts)
- **English:** Noto Serif (Google Fonts), used as a freely available substitute
  for Times New Roman.

## Page and paragraph formatting

| Setting | Value | Rationale |
|---|---|---|
| Paper | A4 | Standard publication size |
| Margins | 2.5 cm all around | Matches existing documents |
| Body size | 10.5 pt | 五号 per the formatting guide |
| Line spacing (`leading`) | 1.5 em | 1.5× line height per the guide |
| Paragraph spacing | 1.5 em | Equivalent to one blank line between paragraphs |
| Alignment | justified | Matches the existing `mindful-organizing.typ` look |
| First-line indent | 2 em | Keeps bilingual paragraphs visually distinct |
| Heading numbering | none | Headings are written verbatim in the host file |
| Heading spacing | `above: 2em`, `below: 1.2em` | Clear section breaks without page breaks |
| Footnotes | 8 pt, left aligned | Per the formatting guide |

## Title page

Titles and subtitles are passed as free Typst content (`title-cn`, `title-en`,
`subtitle-cn`, `subtitle-en`).

The gap between title and subtitle uses `linebreak()` inside a single paragraph
so the spacing follows the `line-height: 1.5` rhythm instead of an arbitrary
`v()` length. A larger `v(1.5em)` separates the Chinese block from the English
block.

## Table of contents

The TOC shows only English headings with dotted leaders and page numbers.
Chinese headings are displayed as compact section headers above their English
counterparts. This mirrors the behavior of the old `helpers.typ` but lives in
the template.

## Host file contract

A host file should look like this and nothing else:

```typst
#import "../lib/mpi-bilingual-template.typ": mpi-bilingual

#show: mpi-bilingual.with(
  title-cn: [中文标题],
  title-en: [English Title],
  subtitle-cn: [——副标题],
  subtitle-en: [—Subtitle],
)

= 一、章节标题
= I. Chapter Title

中文段落……

English paragraph …
```

Compile with the helper script:

```bash
~/documents/mpi/toolkit/scripts/compile-typst.fish ./从物品整理到心灵整理/mindful-organizing.typ [output.pdf]
```

Or manually from the template directory (`~/documents/mpi/translate-files/`):

```bash
cd ~/documents/mpi/translate-files
typst compile --root . ./从物品整理到心灵整理/mindful-organizing.typ
```

The `--root .` is required because the import `../lib/...` would otherwise
escape Typst's sandbox.

## What is intentionally not in the template

- No inline helpers like `#speaker` or `#quote-cn` in host files. The template
  sets global formatting only. Dialogue speakers can be marked with `**Name:**`
  when truly needed.
- No automatic blue styling for scripture quotes, because reliably detecting
  quoted classics in plain text requires explicit markup.
- No per-chapter footnote numbering; Typst's default continuous numbering is
  used.

## References

- `references/静心学堂丛书英文统一格式-20260211.pdf` — MPI formatting guide
- `translate-files/从物品整理到心灵整理/mindful-organizing.typ` — example host
  file and current reference implementation
