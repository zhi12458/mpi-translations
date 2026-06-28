// Helper functions for the bilingual outline and table of contents.

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

#let is-chinese-heading(content) = {
  let txt = to-string(content)
  let cn-re = regex("[\u{4e00}-\u{9fff}]")
  let en-re = regex("[A-Za-z]")
  for c in txt.clusters() {
    if c.match(cn-re) != none { return true }
    if c.match(en-re) != none { return false }
  }
  false
}

#let toc() = context {
  let indent-per-level = 1.5em
  let headings = query(heading.where(outlined: true))
  for h in headings {
    let is-cn = is-chinese-heading(h.body)
    block(
      inset: (left: (h.level - 1) * indent-per-level),
      above: if is-cn { 0.3em } else { 0.7em },
      below: if is-cn { 0.7em } else { 1.2em },
      {
        if is-cn {
          h.body
        } else {
          let page-num = counter(page).at(h.location()).first()
          h.body + box(width: 1fr, repeat[.]) + str(page-num)
        }
      }
    )
  }
}
