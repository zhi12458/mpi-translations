# MPI supporting-material DOCX template profile

Profile identity: `MPI-SM-TPL 1.0.0`.

Default asset SHA-256:
`9f51cbcb6870b3fe9ec51e0a0e6001e0c458fc0a56e50017d032003fb559fd87`.

Use this profile only for the presentation of final English supporting
materials. `source.dj` remains the sole semantic authority and `target.dj`
remains the canonical English. This profile cannot add, delete, summarize, or
reinterpret source content.

## Routing

- If the user supplies a template, that template is the layout authority. Make
  a task-local layout contract, remove its examples/placeholders, and keep the
  SM-RG semantic and reader gates unchanged.
- If the user supplies no template, use
  `../assets/supporting-material-template-v1.docx` and this profile. In a
  source checkout where binary assets are intentionally not versioned, run
  `../scripts/create_template_asset.py` first and require the frozen asset hash.
- Do not invent a lesson number. Omit the lesson line when the number is absent.
- Do not map roles by paragraph position alone. Read the complete source and
  final English, then create an ordered, reviewable content map. A nonstandard
  source role must use a `custom` section rather than being silently discarded.
- Omit a source heading only when its section is genuinely empty. Record the
  omission in the task-local layout contract.

## Fixed visual system

- US Letter portrait, 8.5 × 11 inches.
- Margins: left/right 0.85 inch; top 0.75 inch; bottom 0.72 inch.
- Title and optional `Lesson N` line: centered Times New Roman 14 point bold.
- Section headings: Times New Roman 14 point bold, rendered in cross-platform
  square brackets such as `[Reflection Questions]`.
- Body: Times New Roman 12 point, 1.08 line spacing.
- Footer: Arial 9 point, right aligned, dynamic `Page X of Y` using Word
  `PAGE` and `NUMPAGES` fields.
- Use Heading 1 for template sections and the Word Title style for the title.
- Use real Word numbering for every bullet, decimal item, and lower-letter
  subitem. Never type list markers into paragraph text.
- The template role controls question-prompt and meditation-label styling:
  reflection prompts are bold roman and meditation a/b labels are regular
  roman, even if the presentation map carries legacy Djot emphasis markers.
  Legacy square brackets around meditation group titles are removed. Content
  italics such as lesson or book titles remain italic.
- No tables, images, callouts, highlighting, or decorative rules belong to the
  default profile.

## Standard semantic roles

The default labels are presentation labels, not new source content:

| Content-map role | Default English heading | Expected content form |
|---|---|---|
| `preliminary_reflection` | Preliminary Reflection | prose paragraphs |
| `study_requirements` | Study Requirements | bullet items |
| `reflection_questions` | Reflection Questions | decimal prompts with lower-letter subquestions |
| `contemplation_questions` | Contemplation Questions | decimal items |
| `learning_application` | Learning Application | decimal items |
| `sharing_appreciation` | Sharing Appreciation | prose paragraphs |
| `meditation_guidance` | Meditation Guidance | numbered meditation groups, a/b subheads, bullet practice text |
| `self_reflection` | Self-Reflection | decimal items |
| `custom` | supplied by `heading` | prose and optional decimal/bullet items |

Mapping must follow meaning and source order. Common source labels such as Ask,
Learn, Remember, Reflect, Discern, Apply, Rejoice, meditation blocks, and Check
often map naturally to the roles above, but this is not permission to merge or
drop content.

## Reviewed content-map format

The builder consumes UTF-8 JSON. Inline `*text*` marks italics and `---` becomes
an em dash. A minimal example is:

```json
{
  "title": "English Lesson Title",
  "lesson_number": null,
  "sections": [
    {
      "role": "preliminary_reflection",
      "paragraphs": ["Opening reflection text."]
    },
    {
      "role": "study_requirements",
      "items": ["Read *English Lesson Title* at least three times."]
    },
    {
      "role": "reflection_questions",
      "items": [
        {
          "text": "Main question?",
          "subquestions": ["First subquestion?", "Second subquestion?"]
        }
      ]
    }
  ]
}
```

The task owner must compare the map with the complete canonical English before
building. The JSON is a presentation map, not an alternate translation.

## Deterministic commands

Use the bundled workspace Python, not an arbitrary system interpreter.

```bash
python scripts/build_supporting_material_docx.py \
  content-map.json final.docx

python scripts/validate_supporting_material_docx.py \
  final.docx content-map.json
```

The validator fails on missing mapped text, heading drift, incorrect numbered
paragraph count, template-placeholder leakage, visible Han characters, wrong
page geometry, missing dynamic page fields, or corrupt OOXML.

After it passes, run the Documents accessibility audit, render every page, and
inspect every PNG. Deterministic validation does not replace visual QA.

## Versioning and manifests

- Keep the translation workflow version (`SM-RG`) separate from the template
  profile version (`MPI-SM-TPL`).
- A change to margins, fonts, headings, numbering, fields, content-map schema,
  asset, builder, or validator requires a template-profile version decision and
  new forward-test evidence.
- Record in the final manifest: workflow version, template profile, template
  asset SHA-256 (or user-supplied template SHA-256), authority type, builder
  path/version, validator result, placeholder count, rendered page count, and
  final DOCX hash.
- The DOCX remains an `AI-reviewed draft` until a named human Buddhist/Dharma
  reviewer approves its exact final hash.
