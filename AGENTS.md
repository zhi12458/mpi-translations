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
- **Strategy M preserves temporal and implicit-subject structure.** Flash must
  separately record `temporal_relations`; time/aspect markers including `时`,
  `后`, `才`, `已`, `仍`, and `再` must also appear in `must_preserve`. For
  Buddhist aphorisms, compact classical formulas, parallel clauses, and
  ellipsis, Flash must separately record `elliptical_subject` and distinguish
  agent, cause, instrument, and state holder. Every Pro review must emit one
  paragraph audit per nonblank source line and separately check temporal/aspect,
  condition, negation, degree, elliptical subject, and semantic roles. Missing
  coverage blocks strict QA.
- **Strategy M researches cultural expressions before drafting.** Flash must
  populate `cultural_allusions` for idioms, proverbs, classical/canonical or
  scriptural quotations, fixed classical expressions, and historical
  references. Every declared expression requires a current authoritative web
  lookup receipt and a matching `allusion-decisions.json` entry before Sol may
  start. Pro must independently check the contextual sense in every paragraph.
  `独善其身` is a release regression: distinguish its Mencian sense of
  cultivating one's character and preserving integrity in seclusion from the
  later pejorative sense of looking after only oneself. Missing or stale
  cultural evidence blocks finalization.

## Strategy C release and runtime requirements

The public `mpi-strategy-c` Codex workflow treats this repository and its real
`toolkit` Git submodule as mandatory runtime dependencies, not documentation or
optional installation assets. The rules in this section override any statement
in an older toolkit checkout that describes the translation workflow as
flexible.

Before the first model call of every Strategy C project, the orchestrator must:

1. Validate the installation `READY.json`, the absolute repository paths,
   canonical HTTPS origins, locked Git SHAs, clean worktrees, critical-file
   hashes, and both repository doctor results (`scripts/doctor.py --strategy-c`
   here and `toolkit/scripts/doctor.py --strategy-c` in the submodule).
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

Flash/high may analyze only toolkit-frozen Chinese and terminology. Reuse that
analysis when the Chinese source hash is unchanged. GPT-5.6-Sol medium is the
provisional default English wording authority; Sol high is reserved for
targeted adjudication after the second Pro review, not an automatic full-draft
rerun. V4 Pro/max performs two independent full bilingual reviews without
access to Flash analysis. A second Pro review that still contains a critical or
major blocker triggers targeted Sol high adjudication and, if unresolved, stops
for named human adjudication.

MPI terminology remains authoritative. Network terminology research is
exception-based: use it only for missing or conflicting MPI terms,
context-dependent senses, doctrinal terms, titles, names, quotations, or an
explicit model uncertainty. Freeze each supported decision with its source
context, evidence URLs, rationale, confidence, and scope; unresolved or
conflicting low-confidence decisions must enter the human-review list.

Do not silently use a different commit, a built-in fallback, a generic glossary,
or an old output. Missing dependencies, origin/SHA drift, dirty locked files,
doctor failures, missing receipts, nonzero toolkit exits, stale hashes, or any
strict-gate FAIL/SKIP block completion.

The Strategy C distribution may use a verified compatibility fork when an
upstream maintainer has not merged the required cross-platform runtime. Such a
release must identify both official upstream origins and base SHAs, identify
the exact compatibility-fork origins and locked SHAs, keep the real toolkit Git
submodule pinned to the verified fork commit, and pass the same doctor, test,
fault-injection, and cross-platform gates. It must be labelled as a
compatibility fork and must never be represented as an official upstream
release. Switching between official upstream and a compatibility fork requires
an explicit lock-file release, not an automatic update to either repository's
latest main branch.
