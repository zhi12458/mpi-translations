# MPI Project Conventions

See [toolkit/AGENTS.md](toolkit/AGENTS.md) for the full project conventions.

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

## Strategy C release and runtime requirements

The public `mpi-strategy-c` Codex workflow treats this repository and its real
`toolkit` Git submodule as mandatory runtime dependencies, not documentation or
optional installation assets. The rules in this section override any statement
in an older toolkit checkout that describes the translation workflow as
flexible.

Before the first model call of every Strategy C project, the orchestrator must:

1. Validate the installation `READY.json`, the absolute repository paths,
   canonical HTTPS origins, locked Git SHAs, clean worktrees, critical-file
   hashes, and both repository doctor results.
2. Read this file, `toolkit/AGENTS.md`, and the toolkit skills required by the
   translation and review workflow. Record path, Git SHA, file SHA-256, byte
   count, and timestamp in `instruction-receipt.json`.
3. Use the checked-out toolkit entry points for source extraction, MPI term
   search and map generation, canonical Djot management, bilingual generation,
   mechanical QA, DOCX generation, and subtitle generation/QA. The orchestrator
   may schedule models and write receipts, but must not implement substitute
   versions of these toolkit responsibilities.
4. Route every mandatory toolkit subprocess through the audit executor and
   bind its script hash, inputs, outputs, exit status, and repository identity
   into `tool-execution-receipts.jsonl` and the project `MANIFEST.json`.

Flash may analyze only toolkit-frozen Chinese and terminology. GPT-5.6-Sol is
the English wording authority. V4 Pro reviews the bilingual text without access
to Flash analysis. A second Pro review that still contains a critical or major
blocker stops for named human adjudication.

Do not silently use a different commit, a built-in fallback, a generic glossary,
or an old output. Missing dependencies, origin/SHA drift, dirty locked files,
doctor failures, missing receipts, nonzero toolkit exits, stale hashes, or any
strict-gate FAIL/SKIP block completion. A public release may be marked ready
only after the referenced toolkit commit is present in the official Codeberg
repository and this repository's official SourceHut revision records that exact
submodule commit.
