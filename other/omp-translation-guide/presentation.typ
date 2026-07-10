#import "@preview/touying:0.7.4": *
#import themes.simple: *

#let warm-accent = rgb("#A0522D")
#let dark-text = rgb("#333333")
#let soft-bg = rgb("#FDFBF7")

#show: simple-theme.with(
  aspect-ratio: "16-9",
  config-colors(
    primary: warm-accent,
    secondary: dark-text,
    tertiary: rgb("#8B7355"),
    neutral: dark-text,
    neutral-lightest: soft-bg,
  ),
)

#set text(font: "Liberation Sans", size: 22pt, fill: dark-text)
#set heading(numbering: none)

// Custom title slide so title and subtitle appear together
#slide[
  #align(center + horizon)[
    #text(size: 2em, weight: "bold", fill: dark-text)[
      How we translate Buddhist articles
    ]
    #v(1em)
    #text(size: 1.2em, fill: dark-text)[
      From Chinese source to English reader
    ]
    #v(0.5em)
    #text(size: 1em, fill: warm-accent)[
      with a little help from AI
    ]
    #v(2em)
    #text(size: 0.8em, fill: rgb("#666666"))[
      MPI Translation Project · omp
    ]
  ]
]

== What is omp?

#v(0.5em)

"omp" stands for *Oh My Pi*.

#pause

Think of it as a shared workspace where AI assistants help us with careful, repetitive work.

#pause

- We give the AI our rules, our files, and our style guide.
- It follows the same process every time.
- We stay in charge: AI drafts, humans review.

== What we have translated so far

#v(0.5em)

Our library holds *14 article projects* on Buddhist and Dharma topics.

#pause

So far, *2 articles* are fully translated:

#pause

- *What do we rely on to understand the world?*
- *12-Minute Mindful Ball Guidance*

#pause

More articles are in progress, covering mindfulness, life questions, gratitude, end-of-life care, and Dharma in management.

== Our specialized helpers

#v(0.5em)

Inside omp, we keep special guidebooks called *skills*. They teach the AI how to do each task.

#pause

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  [
    *Translation skill*
    
    How to turn Chinese into English
  ],
  [
    *Terms-search skill*
    
    How to look up Buddhist terms in our database
  ],
  [
    *Review skill*
    
    How to check and improve drafts
  ],
  [
    *Other helpers*
    
    Clean up text, translate slides, convert documents
  ],
)

== Step 1: Receiving the article

#v(0.5em)

An article usually arrives as a Word document or a plain text file.

#pause

We clean it up and prepare a master Chinese file called `source.dj`.

#pause

This master copy becomes the original that every later step checks against.

== Step 2: First draft

#v(0.5em)

The AI reads the Chinese line by line.

#pause

It looks up key Buddhist terms in our database so names and ideas stay consistent.

#pause

Then it writes a first English draft, called `target.dj`, with one English line for every Chinese line.

== Step 3: Self-review

#v(0.5em)

A second AI checks the English draft against the original Chinese.

#pause

It looks for:

#pause

- missing sentences or paragraphs
- awkward English
- Buddhist terms used differently from before
- anything that changes the meaning

#pause

It edits the English directly, and we check the line counts match.

== Step 4: Human review

#v(0.5em)

Now we read the Chinese and English side by side.

#pause

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #align(center, text(size: 1.2em)[中文原文])
    
    #align(center, text(size: 0.8em)[Chinese original])
  ],
  [
    #align(center, text(size: 1.2em)[English])
    
    #align(center, text(size: 0.8em)[translation])
  ],
)

#v(0.5em)

#pause

We approve the draft or flag problems for the AI to fix. This step may repeat several times until the text feels right.

== Step 5: Review by others

#v(0.5em)

When the translation is clean, we send it to volunteers or editors.

#pause

They read it with fresh eyes.

#pause

Once they approve, the article is ready for the next step: typesetting or publishing.

== The whole journey

#v(1em)

#text(size: 1.1em)[
  1. Receive the article
  
  2. Draft the translation
  
  3. Self-review
  
  4. Human review
  
  5. Review by others
  
  6. Publish
]

#v(1em)

#text(size: 0.85em, fill: rgb("#666666"))[
  AI helps at the first three stages; humans lead the last two.
]

== Any questions?

#v(2em)

#align(center, text(size: 1.3em)[We would love to hear from you.])

#v(1em)

#align(center, text(size: 0.9em, fill: rgb("#666666"))[
  Ask about the workflow, the AI, or how you can help review translations.
])

== Thank you

#v(2.5em)

#align(center, text(size: 1.5em)[Thank you for listening.])

#v(1em)

#align(center, text(size: 0.9em, fill: rgb("#666666"))[
  MPI Translation Project · omp
])
