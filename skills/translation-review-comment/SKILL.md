---
name: translation-review-comment
description: Editorial polish pass for CN→EN Buddhist translation — voice, flow, readability. Applies patterns distilled from 473 editor comments across 3 manuscripts. Use AFTER translation-review for terminology/accuracy checks.
---

# Translation Review — Comment (Editorial Polish)

Editorial polish for CN→EN Buddhist translation manuscripts. Focuses on voice, flow,
and readability — the layer beyond terminology and accuracy. Distilled from 473
editor comments by Wade across 3 manuscripts:

| Document | Comments | Period |
|----------|----------|--------|
| 61 人生佛教在当代的弘扬 | 121 | 2026-06-19–20 |
| 附录 我的判教观 | 151 | 2026-06-13–16 |
| 16 觉醒的艺术 | 201 | 2026-04-17–05-24 |

## When to Use

After `translation-review` (terminology, accuracy, line parity). This skill targets the
"Pass 3" layer — does the English read as natural prose, or as translationese?

Apply to `.dj` files with `patch` or to Google Docs comment threads.

## Core Principles

Three principles drive all the specific rules below:

1. **Reader engagement** — the English should invite the reader in. Use "we," active
   voice, conversational tone. The original is an interview/dialogue; the translation
   should sound like one.
2. **Simplicity over sophistication** — prefer everyday words over academic ones.
   If a construction feels heavy, stiff, or formal, simplify it.
3. **Source faithfulness** — never add content not in the Chinese, and never drop
   content that is. But restructure freely for natural English flow — don't mirror
   Chinese word order when it produces awkward English.

## Rule Checklist

Apply these in order. Each rule includes the signal (what to look for) and the fix
pattern. Examples are drawn from actual editor comments.

---

### R1: Active Voice + "We" Subject

**Signal**: Passive voice, impersonal "one," "it," abstract subjects.

**Fix**: Use "we" or a concrete human subject.

```
- "the propagation of Buddhism must move toward modernisation"
+ "we must bring Buddhism into the modern age"

- "it becomes even harder to have an environment for further study"
+ "students find it even harder to have a place for further study"

- "One must further develop the mind of renunciation"
+ "We must further develop the mind of renunciation"
```

**Check**: Scan for "one" (as pronoun), passive "be + past-participle," and sentences
where the subject is an abstract noun phrase. Replace with "we" + active verb.

---

### R2: Noun → Verb Conversion

**Signal**: Heavy noun phrases where a verb would be lighter and clearer.
Especially common with: propagation, promotion, engagement, commercialisation,
modernisation, adjustment, continuation, cultivation, development.

**Fix**: Replace the noun with its verb form. Restructure the sentence around a
human subject (usually "we").

```
- "the adjustment of focus in"          → delete entirely or rephrase
- "for the propagation of the Dharma"   → "to spread the Dharma"
- "the promotion of Humanistic Buddhism" → "as we actively promote..."
- "engagement with the worldly realm"   → "it engages with worldly affairs"
- "commercialisation"                   → "society has become increasingly commercialized"
- "the continuation of"                 → "flow"
```

**Check**: Search for `tion of`, `ment of`, `isation of`. Try deleting the phrase
first — often the sentence flows fine without it.

---

### R3: Simplify Vocabulary

**Signal**: Formal, academic, or literary words that an everyday reader would trip on.

**Fix**: Replace with the simplest word that preserves the meaning.

```
Academic → Everyday:
  "provisions" (资粮)       → "spiritual resources" or rephrase
  "constitutes"             → "is" / "forms" / "makes up"
  "cognizes"                → "understands"
  "transient"               → "changing" / "impermanent"
  "ancestral masters"       → "great masters"
  "eminent monks and great masters" → pick one (redundant)
  "mode of existence"       → "way of living"
  "the degree of this entrapment" → "how tightly we cling"
  "corresponding"           → "proper" / "solid" or delete
  "uncritically"            → delete (accepting covers it)
  "sublimated"              → simpler word
  "encompassing"            → simpler word
  "inherently unsustainable" → "they will not last"
```

**Check**: For each sentence, ask: would I say this word in conversation? If not,
find the everyday equivalent.

---

### R4: Break Long Sentences

**Signal**: Single sentence with 3+ clauses, especially with lists, parallel
structures, or multiple "and"/"while"/"with" connectors.

**Fix**: Split into 2–3 shorter sentences. Each sentence should convey one idea.

```
Before (one sentence):
  "Influenced by society, many within the Buddhist community have also become
   enthusiastic about power and economic gain, treating tourism and ritual services
   as the main focus programme of temples, while neglecting their proper
   responsibility of carrying on the Buddha's mission."

After (two sentences):
  "Influenced by society, some in the Buddhist community have also become
   enthusiastic about power and money. They make tourism and ritual services the
   main focus of temple activities, while neglecting their true duty to carry on
   the Buddha's mission."
```

**Check**: Count clauses. If >2, consider splitting. Especially split:
- When a list starts mid-sentence
- When "while" / "with" introduces a new subject
- When a long parenthetical could stand alone

---

### R5: Remove Unnecessary Words

**Signal**: Modifiers that don't add meaning, filler words, redundant pairs.

**Fix**: Delete them. The sentence should stand without them.

```
Common deletions:
  "so-called"         — almost always deletable
  "generally"         — deletable unless making a specific contrast
  "phenomenon"        — "this phenomenon" → "this"
  "fundamentally"     — deletable
  "necessarily"       — deletable
  "solely"            — deletable
  "briefly summarise" — "briefly" is redundant with "summarise"
  "and influenced"    — deletable
  "the practice of"   — often deletable
  "The development of"— often deletable
  "and investigating" — if already "studying," drop
  "practical" (in "practical methods") — "methods" alone covers it
```

**Check**: For each word: does removing it change the meaning? If not, remove it.

---

### R6: Conversational / Interview Tone

**Signal**: Formal register, stiff constructions, academic phrasing in a dialogue
context. The Chinese originals are interviews; the English should read as spoken word.

**Fix**: Imagine you're saying it aloud. Adjust accordingly.

```
Formal                            → Conversational:
  "What do you think is the       → "Why do you think that is?"
   reason for this?"
  "outdated"                      → "old-fashioned" (in spoken context)
  "It is summarised in the        → Use direct speech
   famous expression: ..."
  "the common point of the        → "what all these issues have
   above-mentioned issues"            in common"
  "From the perspective of        → "Looking at Buddhist history,"
   Buddhist history,"
  "besides remaining grounded     → "In the modernisation of Buddhism,
   in the principle of adapting        while we must stay true to..."
   both to Buddhist teachings
   and to the needs of the people"
```

**Check**: Read the passage aloud (mentally). Does it flow like speech? If it feels
like a lecture transcript, lighten it.

---

### R7: No -ly Adverbs

**Signal**: Adverbs ending in -ly.

**Fix**: Delete them, or restructure to avoid them. Modern English style avoids
adverb clutter.

```
- "briefly summarise"       → "summarise"
- "fundamentally new"       → "new"
- "truly able to"           → "able to"
- "extremely limited"       → "very small number" (restructure)
- "gradually established"   → "established" (ok in context)
```

**Check**: Search for `\w+ly\b`. Evaluate each — most can be dropped.

---

### R8: Concrete over Abstract

**Signal**: Abstract noun phrases that could be expressed more directly.

**Fix**: Make the idea concrete. Use examples, metaphors, or simpler terms.

```
Abstract                          → Concrete:
  "the mistaken identification   → "the mistaken belief in a fixed
   and attachment to the self"        self and our clinging to it"
  "corresponding mental functions" → "the mindset that aligns with them"
  "discern the universal sequence  → "understand how the teachings
   from shallow to deep"               progress from basic to advanced"
  "mode of existence centered      → "a life centered on the Three Jewels"
   on the Three Jewels"
  "a field of specialisation"      → delete (unnecessary abstraction)
  "ideological content"            → "ideas"
```

**Check**: If a noun phrase has 3+ words and feels like jargon, find a plainer way.

---

### R9: Terminology Alignment

**Signal**: Terms that have established translations in the MPI terms database or
prior publications (坐看云起, etc.).

**Fix**: Use the established translation. Load `terms-search` skill and check:
`python3 $MPI_PROJECT_ROOT/terms-search/search.py <term>`

```
Key distinctions from the 3 manuscripts:
  人生佛教  → "Buddhism of Human Life" (NOT "Humanistic Buddhism")
  人间佛教  → "Humanistic Buddhism"
  禅宗      → "Chan" (not "Zen")
  根机      → "faculties" (not "dispositions", not "root")
  高僧大德  → pick one: "eminent monks" or "great masters" (not both)
  假 (三性) → "false" (from emptiness perspective)
  monks     → "monastics" (includes both monks and nuns — 含比丘比丘尼)
  惑业苦    → "delusion, karma, and suffering" (logical order preserved)
  出世乐    → keep consistent with "supreme bliss of Nirvana" used earlier
  戒体      → don't use "precept essence" (hard to understand); expand to
              "the mind of upholding the precepts"
```

**Check**: For any Buddhist technical term, verify against the terms DB before
using a new translation. Consistency across manuscripts matters.

---

### R10: Missing Content Detection

**Signal**: Chinese paragraph has multiple clauses/ideas, but English stops after
1–2 sentences. Quoted speech, poems, rhetorical climaxes in CN are absent from EN.

**Fix**: Flag as "Missing Content." Translate the missing portion.

```
Common patterns:
  - 中文有4-5个短句，英文只有1-2句 → 漏翻了
  - CN has a paragraph with quoted speech → EN paragraph ends before the quote
  - 一些具有相当成就的前辈高僧... → entire passage skipped
  - 内修与外弘也是同样... → entire paragraph missing
  - 民众在接受教育期间，无法从教科书上对佛教获得正面了解 → line missing
```

**Check**: Compare CN and EN paragraph lengths. If CN is substantially longer but
EN seems complete, re-read the CN carefully — something was likely dropped.

---

### R11: Source Faithfulness

**Signal**: English adds concepts, metaphors, or explanations not present in the
Chinese. Or English drops specific details that the Chinese includes.

**Fix**: Remove additions. Translate dropped content. But restructure freely for
natural English — don't mirror Chinese word order if it produces awkward results.

```
Additions to remove:
  - "this addresses one of the most fundamental philosophical questions"
    (not in CN → delete)
  - "preserving the potential for future expression" (not in CN → delete)
  - "making this school widely known in China" (not in CN → delete)

Things to preserve:
  - Quoted speech, idioms, and rhetorical questions — translate fully
  - Logical connectors between sentences — don't skip them
  - The speaker's distinctive voice and argument structure
  - 讲法风格 — the master's teaching style should come through
```

**Check**: For each paragraph, ask: is there content in EN that has no basis in CN?
Is there content in CN that has no corresponding EN? Fix both.

---

### R12: Sentence Structure Clarity

**Signal**: English reads as "translationese" — word order follows Chinese,
parallel structures are misaligned, logical flow is broken.

**Fix**: Restructure for natural English. Reorder clauses. Align parallel items.

```
- "Despite different methods, your focus has always been Humanistic Buddhism"
  → "Although the methods vary, they all center on Humanistic Buddhism"
  (methods vs. focus — misaligned comparison)

- "the root cannot be established"
  → "we cannot establish the root" (add human subject)

- Lists: keep verb forms parallel
  "First, focus on building... Second, keep liberation at the center...
   Third, highlight the unique spirit..."
  (imperative verbs aligned)
```

**Check**: Read each sentence and ask: would a native English speaker structure it
this way? If not, reorder.

---

### R13: Specific Word Fixes

**Signal**: Certain English words have wrong connotations for the context.

**Fix**: Use the recommended replacement.

```
"comeback"     → "return" (comeback = return to popularity, not return to roots)
"evokes"       → "brings" / "gives rise to" (evokes is too formal)
"entertain"    → "have" (entertain thoughts → have thoughts)
"falls"        → "fades" (faith falls → faith fades)
"reverse"      → "transform" (gentler)
"escape"       → softer word in context
"dismantle"    → "challenges" / "undoes" (dismantle is too aggressive)
"head"         → "beginning" (head of the Eightfold Path → beginning)
"none"         → "not many" (when the claim is "未提供多少" not "none at all")
"function"     → "purpose" (in non-technical contexts)
"object"       → "focus" (object of practice → focus of practice)
"uncommon"     → "unique" / "distinctive" (不共 = not shared with other paths)
"conduct and propagate" → "uphold and spread"
"attainment of Buddhahood" → "enlightenment" (in some contexts, to avoid
                            Buddha/Buddhahood repetition)
"liberation"   → "liberation" is fine, but check if context means "解脱" or "出世"
```

---

### R14: Positive Feedback — Praise the Translator (随喜)

**Signal**: A passage reads well — accurate, natural, fluent. Or the translation
as a whole shows consistent quality.

**Action**: Praise the first-pass translator by name. The editor consistently opens
or closes review sections with affirmations directed at the translator:

```
"随喜师兄整体翻译还是很好的，前后连贯，清晰"
"随喜师兄翻译 准确流畅！"
"随喜师兄上段和本段翻译 准确流畅"
"随喜师兄查证出处"
"整段翻译的很好"
"整段翻译还是很棒的"
"翻译一气呵成 很精彩"
"很赞叹 简洁有力！"
"这个功不唐捐翻译的真好"
"随喜这个翻译！衔接的很好"
"这个翻译很赞！"
"这段翻译也很好"
"整段翻译的还是很好的"
"翻译的意思都表达出来了"
"本段翻译的都很好，随喜赞叹！"
```

This matters for three reasons:
1. It tells the translator what to preserve — don't accidentally "fix" what works
2. It follows the deliberation protocol — rejoicing (随喜) comes first, before
   any criticism. The translator should feel their effort is seen and valued
3. It names the translator explicitly — "随喜师兄" — making the praise personal,
   not generic. When reviewing, use the translator's name from the document title
   (e.g. 妙蕊, 法轩, Fiona)

## Workflow

```
1. Read source.dj + target.dj (full files)
2. Apply R1–R13 in order, scanning the English line by line
3. For each issue found, apply with patch or write to translation-findings.dj
4. Note well-translated passages (R14)
5. Final pass: read the full English aloud — does it flow?
```

## Pitfalls

- Don't apply this skill before `translation-review` — terminology must be correct first.
- Don't over-correct: some formal constructions are appropriate for certain passages.
  Judge per context.
- When converting nouns to verbs, keep the meaning intact — don't simplify away
  doctrinal nuance.
- The "we" subject is generally preferred but not absolute. If a passage describes
  a general principle without a specific agent, passive/impersonal may be correct.
- Positive feedback (R14) is not optional fluff — it guides what to preserve.
