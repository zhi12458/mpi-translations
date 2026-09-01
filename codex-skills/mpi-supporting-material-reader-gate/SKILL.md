---
name: mpi-supporting-material-reader-gate
description: Default MPI workflow for translating Chinese Buddhist course supporting materials, study guides, reflection questions, practice handouts, and lesson supplements into natural English for small-group discussion. Use automatically for 辅材, 辅助材料, 课程辅材, supporting material, or discussion handout requests. Do not use for articles, books, transcripts, PPT, audio, or video unless the user explicitly chooses this workflow.
---

# MPI Supporting Material Reader-Gate Workflow

Workflow identity: `SM-RG 1.0.0`.

Default DOCX template profile: `MPI-SM-TPL 1.0.0`.

Use this workflow for short instructional material that helps a small group
(normally about five people) understand and discuss a Dharma article or lesson.
Its English must be accurate, concise, easy to read aloud, and usable without a
facilitator repeatedly rephrasing it.

This is a separate supporting-material route, not a shortened production T1
article workflow. Human feedback on the Lesson 57 comparison established it as
the default route for this genre; do not generalize that result to articles or
books.

Read [references/workflow.md](references/workflow.md) before translating or
reviewing supporting material.

When DOCX delivery is requested, also read
[references/template-profile.md](references/template-profile.md). Use the
versioned default template asset when the user has not supplied another layout
reference. A user-supplied template overrides the default profile's appearance
only; it never changes source authority or review gates.

## Non-negotiable boundaries

- The frozen Chinese `source.dj` is the sole semantic authority. A supplied
  template controls structure and appearance only; its examples and
  instructions are not source content.
- Preserve the source's questions, numbers, negation, degree, conditions,
  quotation scope, doctrinal distinctions, first-person practice voice, order,
  numbering hierarchy, and blank-line positions. Do not add facilitation advice
  or explanations absent from the Chinese.
- Freeze and apply the MPI term map. Search the project termbase before
  inventing a rendering; unresolved doctrinal terms require evidence or human
  choice.
- Use the fixed isolated roles in the workflow reference. If a required model,
  effort level, fresh session, or isolation condition is unavailable, report
  `supporting-material reader-gate blocked`; do not substitute silently.
- English-only readers receive sanitized English with neutral paragraph IDs
  only. They must not see Chinese, the term map, old drafts, model identity, or
  prior feedback.
- Reader suggestions never outrank the Chinese. Recheck every accepted change
  against the source. Spelling, punctuation, and unquestionably meaning-neutral
  local collocation repairs may be applied directly; changes affecting doctrine,
  degree, terminology, metaphor, number, tone, omission/addition, or paragraph
  structure require a concise user decision table before application.
- Final completion requires a full Chinese recheck, bidirectional semantic
  regression, and two fresh English-only final readers with zero blockers.
- Deliverables remain `AI-reviewed draft` until a named human Buddhist/Dharma
  reviewer approves the exact final hash. AI reader roles are not human
  approval.

## Output rule

Produce the English deliverable requested by the user, normally a DOCX that
follows the supplied template while removing placeholders and template-only
content. If no template is supplied, build from
`assets/supporting-material-template-v1.docx` through the deterministic builder
and validator described in the template profile. If the installed asset is
missing, regenerate it with `scripts/create_template_asset.py` using the
bundled workspace Python and verify the frozen profile hash before building;
do not substitute an unrelated DOCX. Keep internal bilingual,
receipts, isolation inputs, decisions, QA, rendered pages, and the final
manifest in an isolated results directory. A comparison with full T1 is
optional validation evidence, not a routine deliverable. Record both
`SM-RG 1.0.0` and the active template profile/version/hash in the final
manifest.
