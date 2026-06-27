---
name: translation
description: Translate Chinese↔English Buddhist/Dharma content — register guidance from Mindfulness Bell corpus, tone, voice, cultural bridging technique.
---

# Translation

Core translation technique for Buddhist/Dharma content. Conventions (djot format,
terms DB query, workflows, output format) are in AGENTS.md.

## Mindfulness Bell Corpus

English Buddhist prose — register/style reference for translation.

- **PDFs + index**: `~/meta/www.files/public/The Mindfulness Bell/` — 6 issues (MB92–MB97, 2023–2026), `index.yaml` lists all articles by author/title/page
- **Articles**: `~/documents/jingxin-lessons/Mindfulness Bell/MB{92..97}/*.md` — per-issue markdown files. Read with `read_file`.

Four registers, useful as style targets:

| Register | Example | Key features |
|----------|---------|-------------|
| Dharma talk | Thầy (MB94 "Roses and Garbage", MB97 "Go as a River") | Short sentences, concrete images, coined terms ("interbeing"), oral address, Sanskrit with narrative explanation |
| Teaching lineage | Sister Đoan Nghiêm (MB93 "Our Patriarch Liễu Quán") | "We" voice, terms explained, cultural bridging ("like Jesus"), dates in narrative |
| Personal narrative | Mick McEvoy (MB94 "Touching the True Nature") | First-person, confessional, borrowed Dharma vocabulary, vernacular |
| Editorial | Brother Pháp Lưu (MB94 welcome letter) | Polished but warm, conceptual framing, "we" address |

Quick-find in index: Thầy talks → `"Thích Nhất Hạnh"` + page ≤ 10; teachings → `"Sister"` or `"Brother"`; narratives → first-page articles by non-monastics; lineage → `"Patriarch"` or `"ancestor"`.

## Translation Principles

1. **Terms**: Either keep Sanskrit w/ narrative explanation (bodhisattva, Māra) OR coin new English (interbeing, inter-are). Avoid clunky calques.
2. **Cultural bridging**: Add bridges for Western readers. A Chinese text mentioning 孔子 can stay; explain the function. Đoan Nghiêm's "like Jesus" is the pattern.
3. **Tone**: Chinese Dharma texts are typically more formal than English equivalents. Decide consciously: keep formality or warm up (Thầy style).
4. **Voice**: Direct address ("you"), concrete images, and oral rhythm make Dharma land in English. Abstract noun chains (common in Chinese→English translationese) kill it.
5. **Sutra quotes**: Use standard English Buddhist idiom. Check terse-idiom conventions (e.g., Diamond Sutra "lives" not "bodies").

## Pitfalls

### Pre-flight accuracy check

Before delivering a translation, run through the structured accuracy/readability
taxonomy in `skills/translation-review/references/common-issues-taxonomy.md`.
Catching these before review saves iteration cycles:
- Omission, over-literal renderings, over-free renderings, subject confusion,
  overtranslation, terminology errors
- Long/nested sentences, passive voice clustering, nominalization, top-heavy
  structure, obscure word choices, weak transitions

### 1:1 line mapping

Each physical source line maps to exactly one physical target line. Never merge
continuation lines (lines ending with `  ` soft breaks) into a single
translation entry. The bilingual format preserves the original line structure —
breaking this destroys alignment.

### Blank lines in bilingual

When creating an initial bilingual template from source only: blank source
lines pass through as-is. Only non-blank lines get an empty target placeholder.
Treating blank lines as content lines (adding target+separator) creates
excessive blank clusters. See `references/bilingual-format.md`.

### Soft break markers

Trailing `  ` (two spaces) on source lines indicate soft line breaks (paragraph
continuations). Preserve these markers on both source and target lines.

### Practice element lists: use noun forms

When translating lists of Buddhist practice elements — especially the five
essentials (皈依、发心、戒律、正见、止观) or similar enumerated components —
render each as a noun phrase, not a gerund. "Refuge, aspiration, precepts,
right view, śamatha-vipaśyanā" — not "taking refuge, arousing aspiration."
These are named components of a system, not actions being described. The same
applies to any catalog-style listing (三学, 八正道 components, etc.).

### Terminology decisions: user is the source of truth

When the user proposes a non-standard rendering (e.g. "人间佛教 should be
'Buddhism for daily lives'") or asks for your input ("although I don't know
what X should be"), respond with a brief options table — strengths and
weaknesses — and let them choose. Do NOT unilaterally commit to a rendering
and start applying it across the file. The user often has a reason for their
proposal (e.g. deliberate departure from terms DB convention) or a strong
opinion they haven't voiced yet. Once they pick, then apply consistently and
annotate in the inline `{% %}` comment WHY this rendering was chosen so future
editors know it was deliberate, not a slip.

## Polishing (润色)

After translating, do a deliberate readability pass before submitting for review.
Read the English aloud — if a sentence can't be spoken in one breath, fix it.

These are common patterns (not an exhaustive list). For the full taxonomy with
more categories and examples, read
`../translation-review/references/common-issues-taxonomy.md`.

Examples of systematic adjustments:

1. **Passive → active**. Passive clusters (3+ per paragraph) are the top
   readability killer in CN→EN translation. `If meat consumption were reduced`
   → `If people consume less meat`.
2. **Nominalization → verb**. `placed emphasis on cultivating` → `emphasized
   cultivating`; `the application of` → `applying`.
3. **Sentence splitting**. If a sentence has 3+ clauses and runs past one breath,
   split it. The source's period is not a contract — English readers need
   shorter breath units than Chinese readers.
4. **Academic → plain**. `constitute` → `make up`; `facilitate` → `help`;
   `endeavor to` → `try to`; `in order to` → `to`. These texts are lectures
   and conversations, not journal articles.
5. **Register match**. Dharma talks and dialogues should sound spoken —
   contractions, direct address, concrete images. If the English reads like a
   paper abstract, warm it up. Check against the MB corpus registers for the
   target genre.

Do NOT apply these mechanically — each is a judgment call. A passive may be
correct when the agent is unknown; a nominalization may be the right technical
term. The goal is natural English that matches the source's register, not a
formulaic rewrite.

## Meditation / Mindfulness Content

When translating guided meditation scripts, exercise guides, or posture instructions
(rather than Dharma talks), use a lighter workflow. See `references/meditation-translation.md`.

## Pitfalls

### article-specific scripts

`scripts/proofread-pdf.py` is hardcoded for 佛教徒的人生态度 — body-start
markers, header patterns, slug regex. Do NOT reuse for other articles.
Create article-specific scripts per `references/proofread-pdf-workflow.md`.

## References

- `references/meditation-translation.md` — lighter workflow for meditation/mindfulness content
- `references/markdown-to-djot.md` — converting .docx.md to .dj for translation prep
- `references/bilingual-format.md` — bilingual.dj layout: source/target adjacent, blank separator between pairs
- `references/diacritics-convention.md` — diacritics rules
- `references/proofread-pdf-workflow.md` — pattern for creating article-specific PDF-vs-DOCX comparison scripts
- `../translation-review/references/common-issues-taxonomy.md` (cross-skill) — structured accuracy/readability checklist for pre-flight review
