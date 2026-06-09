---
name: dharma-translation
description: Translate Chinese Buddhist Dharma talks into English djot with annotations. Use when the user asks to translate a Dharma talk, 开示, Buddhist lecture, or similar material from Chinese to English.
---

# Dharma Talk Translation

## Trigger

User asks to translate a Chinese Buddhist Dharma talk (开示, 讲座, 法义) to English, or convert a PDF of such material into a translated djot file.

## Workflow

### 1. Extract source text from PDF

Prefer `pdftotext -layout` — it's the most reliable fallback and almost always available:

```bash
pdftotext -layout input.pdf /tmp/extracted.txt
```

pypdf and pdfplumber may not be installed; pdftotext (poppler-utils) is the safe default.

### 2. Convert to structured djot

Clean the extracted text into a djot file (`original.dj`) with this structure:

- `# Title` — h1, the talk title
- Subtitle line — date and venue, prefixed with `——`
- Opening remarks — body paragraphs before the first section
- `## 一、Section Name` — h2 for each numbered section (一、二、三、etc.)
- Closing line — revision date in parentheses

Strip page numbers (standalone digits separated by form feeds `\f`). Join broken lines within paragraphs — Chinese text joins cleanly with `''.join()` since there are no inter-word spaces.

### 3. Translate

Translate directly — no external translation APIs. The model IS the translator.

Key approach:
- Preserve the djot structure exactly (headings, paragraphs)
- Translate section headings preserving the Chinese numbering (一、→ 1., 二、→ 2., etc.)
- Keep the original Chinese in `%` comment lines alongside the translation (see annotations below)

### 4. Annotate in djot comments

Use `%` comment lines before relevant paragraphs to annotate:

- **Buddhist technical terms**: Sanskrit equivalents (e.g., 五蕴 → five aggregates / skandhas), doctrinal context
- **Cultural references**: Historical figures, place names, sutra names with explanation
- **Structural notes**: Why the speaker frames something a certain way, organizational philosophy
- **Recurring metaphors**: The McDonald's analogy throughout, the lamp/light metaphor

Format:
```
% Chinese term (pinyin) = English gloss, Sanskrit if applicable. Brief context.
Paragraph text here...
```

For sutra quotes, annotate the sutra name with both Chinese and Sanskrit.
For organizational terms (传帮带, 分灯, 三种精神), explain their meaning within the community's framework.

### 5. Output files

- `original.dj` — cleaned Chinese djot
- `translated.dj` — English translation with `%` annotations

## Pitfalls

- Do NOT call external translation APIs. Translate directly.
- Do NOT delete comparison/对照 files — they are intentional work artifacts.
- pdftotext may produce hard line breaks at column boundaries; join within paragraphs using `''.join()` for Chinese.
- Page numbers appear as isolated digits between form feeds (`\f`); strip them with regex.
- Djot `%` comments work line-by-line; place them on their own lines before the relevant paragraph.
- Keep annotations concise — one or two lines, not an essay.
