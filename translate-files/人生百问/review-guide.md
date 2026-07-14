# 人生百问 Review Guide — Batched Direct-Edit Pass

## Goal
Fix the five feedback categories in one batched patch per chapter:
1. 漏译 (missing content)
2. 字对字翻译 (calque / literal translation)
3. 用词不够简单易懂 (word choice too hard / formal)
4. 句子连贯性 (sentence coherence / flow)
5. 导师说话风格 (mentor speaking style — warm, direct, conversational)

## Workflow (B3 direct-edit mode)
1. Read the full chapter source + target in one pass.
2. Collect every issue using the three passes and R1–R14 below.
3. Batch all fixes into one set of exact-string replacements.
4. Apply with `patch` (mode='replace').
5. Verify line counts match the source file.
6. Do NOT iterate; do not write a review-comments file.

## Three passes

### Pass 1: Accuracy and completeness
- A1 Missing content: compare every paragraph; no skipped or truncated lines.
- A2 Mistranslation: especially negation, modals, numbers, doctrinal claims.
- A3 Terminology consistency: same Chinese term → same English term.
- A4 No additions that change meaning (e.g., avoid inserting "we must" where source is descriptive).
- A5 Number/time/person scope matches source.

### Pass 2: Fluency and naturalness
- F1 Calque / translationese: avoid carrying Chinese grammar/word order into English.
- F2 Register drift: this is conversational Q&A; keep English warm and direct, not essay-formal.
- F3 Broken collocation: use idiomatic English verb+noun pairs.
- F4 Pronoun/reference chains: ensure subjects are clear.
- F5 Sentence rhythm: split breathless multi-clause sentences; vary sentence openings.

### Pass 3: Dharma and cultural fitness
- D1 Buddhist term register: follow the terminology table below; consult the terms DB if unsure.
- D3 Tone / voice of the teacher: preserve rhetorical questions, direct address, warmth.
- D4 Implicit meaning: make sure irony, politeness, and implication survive.
- D5 Formatting fidelity: preserve Djot emphasis (`*...*`), paragraph breaks, and soft-line markers.

## R1–R14 final checklist
R1 spelling/punctuation; R2 capitalization; R3 articles; R4 subject-verb agreement;
R5 tense consistency; R6 voice; R7 prepositions; R8 modifiers; R9 parallelism;
R10 redundancy; R11 word choice (concrete, simple); R12 varied sentence openings;
R13 flow/transitions; R14 read aloud for oral delivery.

## Key terminology — 人生百问

| Chinese | English | Notes |
|---|---|---|
| 三级修学 | Three-Stage Practice | DoT定稿 |
| 皈依三宝 | take refuge in the Three Jewels | 贸然皈依 → "take refuge lightly" / "without being ready" |
| 善知识 | wise teacher / great teacher / authentic teacher | Avoid "great wise teacher" redundancy |
| 大善知识 | great teacher / wise teacher | |
| 惑业 | delusion and karma | Not "confusion and karma" |
| 迷惑 | delusion | In Buddhist contexts, not "confusion" |
| 大自在 | great freedom and ease | Not just "great freedom" |
| 开启 | awaken / bring forth / unfold | Not "opened up" |
| 言语道断，心行处灭 | Where words fall silent and mental activity cease | Or "Words fail, and mental activity ceases" |
| 众生 | sentient beings | |
| 凡夫心 | mind of an ordinary being | |
| 加持 | blessing / empowerment | "supports and blesses one another" |
| 末法 | Dharma-ending age / Age of Dharma Decline | Check terms DB |
| 暇满 | precious human life / leisure and endowment | |
| 定课 | daily practice / daily recitation | Context-dependent |
| 八步骤三种禅修 | Eight Steps and Three Types of Meditation | DoT定稿 |
| 人生佛教 | Buddhism for Human Life | Distinct from 人间佛教 / Humanistic Buddhism |
| 人间佛教 | Humanistic Buddhism | Distinct from 人生佛教 |
| 同喜班 | Tongxi Class | MPI convention |
| 皈依 / 发心 / 戒律 / 正见 | refuge, aspiration, precepts, right view | Noun forms in lists |
| 依止 | reliance / rely on | Avoid "reliance relationship" |
| 报身 | reward body | MPI convention |
| 化身 | transformation body | MPI convention |
| 等流果 | result of equal outflow / correlative effect | |
| 四力 (忏悔) | four powers: remorse, support, restraint, refuge/reliance | |
| 无缘大慈、同体大悲 | unconditional great compassion and the great sympathy of seeing others as oneself | |
| 人成即佛成 | When a Human Is Perfected, Buddhahood Is Perfected | |
| 登地菩萨 | bodhisattva who has attained the grounds | |
| 明心见性 | clear the mind and see the nature | |
| 无住生心 | arouse the mind without attachment | |
| 诸法如实相 | true suchness of all phenomena | |
| 颠倒梦想 | inverted dreams | |
| 颠倒妄想 | deluded inversion | |
| 十二因缘 | Twelve Links of Dependent Origination | |
| 无我 | no-self / anatman | |
| 我法二执 | attachment to self and dharmas | |
| 三性 | three natures: falsely conceived, dependent, perfectly realized | |
| 末那 | Manas | |
| 阿赖耶 | Alaya | |
| 唯识 | Consciousness-Only | |
| 唯识三十论 | Thirty Verses on Consciousness-Only | |
| 中观 | Madhyamaka | |
| 天台 | Tiantai | |
| 一念三千 | three thousand realms in a single thought | |
| 三传 | Theravada, Chinese Buddhism, Tibetan Buddhism | |
| 南传 | Theravada | |
| 汉传 | Chinese Buddhism | |
| 藏传 | Tibetan Buddhism | |
| 佛陀出世的本怀 | Buddha's original purpose in appearing in the world | |
| 契理契机 | accordant with principle and adapted to the times | |
| 正本清源 | return to the source and clarify what is truly central | |
| 随缘 | responding to conditions / in harmony with conditions | Context-dependent |
| 随喜 | rejoice | |
| 闻思修 | hearing, contemplating, cultivating | 修 is broad cultivation, not just meditation |
| 修学 | practice and study / cultivation and learning | Do not drop the "study" dimension |
| 传帮带 | transmit, help, guide | Three-part mentoring |
| 分灯 | lamp-dividing | Decentralization of authority |
| 自觉 | self-awareness / voluntary commitment | First of the "Three Spirits" |
| 法治 | rule-based governance | Second of the "Three Spirits" |
| 无我利他 | selfless service to others | Third of the "Three Spirits" |
| 重要感、优越感、主宰欲 | sense of importance, superiority, desire to control | |

## Style guidance — conversational Q&A
- Use contractions where natural ("don't", "can't", "it's") when the Chinese feels spoken.
- Prefer plain verbs: "rush about" not "bustle about"; "use reason well" not "use reason skillfully".
- Avoid top-heavy sentences; move the main clause forward.
- Split breathless sentences at natural breaks.
- Preserve the speaker's warmth and direct address.
- Don't flatten rhetorical questions into essay statements.
- Keep Buddhist register but accessible: prefer standard English Buddhist idiom over literal calque.

## What NOT to do
- Do not add parenthetical explanations not in the source.
- Do not change the meaning by inserting "must" for 应当/倡导 unless source has 必须/务必/一定.
- Do not invent new renderings for established DB terms.
- Do not break line counts without adjusting the source file too.
- Do not write review-comments.dj; this is direct-edit mode.

## Output
- Edited `chapters/<chapter>-target.dj`.
- If line counts drift, adjust both `chapters/<chapter>.dj` and `chapters/<chapter>-target.dj` together and report it.
- Final report: list of changes made (concise), any line-count adjustments, and any unresolved terminology questions.
