# MPI Project Conventions

See [toolkit/AGENTS.md](toolkit/AGENTS.md) for the full project conventions.

## Default article and book routing

- For ordinary Chinese-to-English Buddhist books, articles, and documents, use
  the installed `$mpi-strategy-t1-codex` skill (`T1-Codex 1.2.0`) by default.
  This includes the source-bound Chinese semantic-segmentation stage and the
  post-translation native-English editing and reader gates.
- An explicit request for T1-OMP, C, M, M2, a media-specific workflow, or the
  supporting-material route below overrides this default. Do not silently mix
  prose or evidence between workflows.
- Workflow activation is not document approval. Every output remains an
  `AI-reviewed draft` until a named Buddhist/Dharma reviewer approves its exact
  final target hash.

## Supporting-material routing

- For Chinese Buddhist lesson supporting materials, study guides, reflection
  questions, practice handouts, or requests described as `辅材`, `辅助材料`,
  `课程辅材`, `supporting material`, or `discussion handout`, use the
  `$mpi-supporting-material-reader-gate` skill (`SM-RG 1.0.0`) by default.
  These materials are
  written for small-group discussion and use the isolated whole-document Sol
  draft, one full bilingual review, source-based adjudication, full Chinese and
  semantic regression, and initial plus final English-only dual-reader gates.
- Do not route articles, books, transcripts, PPT, audio, or video to that
  supporting-material workflow unless the user explicitly chooses it. Articles
  and books continue to use the appropriate strict T1 route.
- Human feedback validates this workflow as the default genre route; it does
  not pre-approve future outputs. Each completed artifact remains an
  `AI-reviewed draft` until a named human Buddhist/Dharma reviewer approves its
  exact final hash.

## Repository quality addendum

The following requirements are mandatory for every translation in this
repository and take precedence if the checked-out toolkit submodule is older:

- **Concise and immediately understandable English.** Accuracy is necessary but
  not sufficient. After accuracy repair, run a separate concision pass: remove
  duplicated framing, abstract carrier phrases, support-verb constructions,
  stacked qualifications, and unnecessary near-synonyms. Prefer plain concrete
  verbs. Recheck the Chinese afterward so concision does not delete negation,
  degree, logical relations, qualifications, or the teacher's voice. Written
  publication prose must not become academic, nominalized, or needlessly long.
- **Titles and headings require an independent accuracy pass.** For the main
  title, TOC, and every body heading, identify the semantic head, modifier
  scope, purpose/path relation, and distinctions in parallel series. Prefer the
  shortest idiomatic English that preserves those distinctions; do not add
  generic formulas such as “an exploration of” or “progress toward” merely to
  sound formal. Repeated TOC/body headings must use identical English after
  numbering and Djot markers are removed.
- **Review gates are complementary.** A source-only semantic analysis may catch
  Chinese ambiguity but cannot prove that the drafted English is concise or
  that every title is correct. A bilingual reviewer must still inspect the
  entire draft for meaning, titles, readability, and register. A clear semantic
  certificate proves only that its review cycle found no blocking accuracy
  issue; it is not style or title approval.
