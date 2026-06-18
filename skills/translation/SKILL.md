---
name: translation
description: Translate Chinese↔English Buddhist/Dharma content — register guidance from Mindfulness Bell corpus, tone, voice, cultural bridging technique.
---

# Translation

Core translation technique for Buddhist/Dharma content. Conventions (djot format,
terms DB query, workflows, output format) are in AGENTS.md.

## Mindfulness Bell Corpus

Register/style patterns in English Buddhist prose.

- Location: `/home/user/meta/www.files/public/The Mindfulness Bell/`
- 6 issues: MB92–MB97 (2023–2026), each ~84–116 pages
- Index: `index.yaml` (article titles, authors, pages)
- **Articles**: `~/documents/jingxin-lessons/Mindfulness Bell/articles/MB{92..97}/*.md` — 93 individual markdown files with YAML frontmatter. Read directly with `read_file`.
- Extraction script: `/tmp/extract_mb_articles.py` (re-run if PDFs change)

## Register Reference

Four registers observed, useful as style targets:

| Register | Example | Key features |
|----------|---------|-------------|
| Dharma talk | Thầy (MB94 "Roses and Garbage", MB97 "Go as a River") | Short sentences, concrete images, coined terms ("interbeing"), oral address ("It's clear?"), Sanskrit kept with narrative explanation |
| Teaching lineage | Sister Đoan Nghiêm (MB93 "Our Patriarch Liễu Quán") | "We" voice, terms explained, cultural bridging ("like Jesus"), dates woven into narrative, still oral |
| Personal narrative | Mick McEvoy (MB94 "Touching the True Nature") | First-person, confessional, borrowed Dharma vocabulary, emotional directness, vernacular |
| Editorial | Brother Pháp Lưu (MB94 welcome letter) | Polished but warm, conceptual framing, "we" address |

## Translation Principles

1. **Terms**: Either keep Sanskrit w/ narrative explanation (bodhisattva, Māra) OR coin new English (interbeing, inter-are). Avoid clunky calques.
2. **Cultural bridging**: Add bridges for Western readers. A Chinese text mentioning 孔子 can stay; explain the function. Đoan Nghiêm's "like Jesus" is the pattern.
3. **Tone**: Chinese Dharma texts are typically more formal than English equivalents. Decide consciously: keep formality or warm up (Thầy style).
4. **Voice**: Direct address ("you"), concrete images, and oral rhythm make Dharma land in English. Abstract noun chains (common in Chinese→English translationese) kill it.
5. **Sutra quotes**: Use standard English Buddhist idiom. Check terse-idiom conventions (e.g., Diamond Sutra "lives" not "bodies").

## Pitfalls

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

## Quick-Find in MB Corpus

Common article types to search for register examples:
- Thầy's Dharma talks: search index for "Thích Nhất Hạnh" + page ≤ 10
- Sister/brother teachings: search for "Sister" or "Brother" + "DHARMA TEACHING"
- Personal narratives: first-person voice, often pages 8–60
- Lineage/history: "Patriarch," "ancestor," dates in text

## Meditation / Mindfulness Content

When translating guided meditation scripts, exercise guides, or posture instructions
(rather than Dharma talks), use a lighter workflow. See `references/meditation-translation.md`.

## References

- `references/meditation-translation.md` — lighter workflow for meditation/mindfulness content
- `references/markdown-to-djot.md` — converting .docx.md to .dj for translation prep
- `references/bilingual-format.md` — bilingual.dj layout: source/target adjacent, blank separator between pairs
- `references/diacritics-convention.md` — diacritics rules
