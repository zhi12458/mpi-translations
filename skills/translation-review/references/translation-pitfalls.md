# Translation Pitfalls — MPI Buddhist Texts

Patterns found in CN→EN translation review. Add to this file as new patterns emerge.

## Terminology conflation

### 人生佛教/人间佛教 — distinct concepts

人生佛教 (Taixu's "Buddhism for Human Life") and 人间佛教 (Yinshun's "Humanistic Buddhism")
are distinct doctrinal positions in modern Chinese Buddhism. Do not conflate both into
"Humanistic Buddhism." When the source uses 人生佛教, render as "Buddhism for Human Life"
or "Human Life Buddhism."

### 心性论 → buddha-nature (WRONG)

心性 (mind-nature) is broader than 佛性 (buddha-nature / tathāgatagarbha).
When a text discusses 心性 in the context of Confucian self-cultivation or general
Buddhist psychology, use "mind-nature" or "nature of mind." Reserve "buddha-nature"
only when the text explicitly references tathāgatagarbha doctrine.

### 恨 → resentment (WRONG)

恨 means "hatred," not "resentment." In the triad 羡慕嫉妒恨 (envy, jealousy, hatred),
the force is strong. "Resentment" is too mild.

### 感悟 → conversant / heartfelt (WRONG)

感悟 means experiential insight or realization. It is not intellectual familiarity
("conversant") or emotional warmth ("heartfelt"). Render as "insight," "realization,"
or "deep understanding."

### 关爱/关怀 → compassion (WRONG)

Chinese 关爱 and 关怀 mean "care" or "loving care." They are NOT 慈悲 (compassion / karuṇā).
Conflating them obscures two distinct Buddhist concepts.

Check every occurrence of "compassion" in a translation against the source:
- If source is 关爱/关怀 → "care"
- If source is 慈悲 → "compassion" (correct)
- If source is 悬壶济世 → "compassionate mission" (correct — the healing spirit)

### 生存层面 → making a living (WRONG)

生存层面 = the existential/survival dimension. Not just earning wages.
→ "survival-level needs" or "the level of basic existence"

## Loss of Dharma meaning

### 生生增上 → continuously elevate our life (INCOMPLETE)

生生 = life after life (multi-life Buddhist perspective). The single-life rendering
"continuously elevate our life" loses the Dharma meaning entirely.
→ "continuously elevate our life, life after life"

## Degree / register shifts

### 学部委员 → Member (UNDERSTATES)

学部委员 is CASS's highest academic title, equivalent to "Academician."
"Member" understates the prestige significantly. → "Academician" or
"Member of the Academic Divisions."

### 文明 → culture (WRONG)

文明 is "civilization," not 文化 "culture." When a text discusses 文明传播
(civilizational transmission), do not substitute "cultural transmission."

### 教制建设 → reforming (ADDS CONNOTATION)

教制建设 means "developing/building monastic institutions." Adding "reforming"
introduces a connotation of fixing something broken that is not in the source.
→ "developing monastic institutions" or "institutional development."

### 一荣俱荣、一损俱损 → too loose

This idiom has a conditional structure: "if one prospers, all prosper; if one
suffers, all suffer." Rendering as "thrived together and suffered together"
loses the mutual-dependence logic. → "shared prosperity and adversity alike"
or "rose and fell together."

### 成圣成贤 collapsing

圣 (sage) and 贤 (worthy) are distinct Confucian categories. Collapsing both
to "a sage" loses the distinction. → "sagehood and worthiness" or "a sage or worthy."

#### 因病返贫 → "back into poverty"
"返贫" means becoming poor due to illness, not returning to previous poverty. Use "into poverty" or "driven into poverty."

#### Diacritics: use DB form, not academic Sanskrit
| Wrong | Right | Source |
|---|---|---|
| `Mahāsthāmaprāpta` | `Mahasthamaprapta` | 佛教术语 |
| `Yogācārabhūmi Śāstra` | `Yogacarabhumi-Sastra` | 经论名 |
| `Avalokiteśvara` | `Guanyin` | 佛教术语 |
| `pravāraṇā` | `Pavarana` | BAICKZ |

Exception: `Kṣitigarbha` — DoT定稿 uses diacritics, so keep them.
When in doubt, search the DB and follow the highest-priority source. See dharma-translation skill `references/diacritics-convention.md`.

返贫 = become poor (from a non-poor state) due to medical costs. "Back" implies
the person was previously poor — not necessarily true. This is about medical bankruptcy.
→ "into poverty" or "fall into poverty" (no "back")

## DoT定稿 term drift

### 念死 → recollection of death (WRONG per DoT定稿)

DoT定稿 has "Cultivating mindfulness of death" / 佛教术语 has "contemplating the
impermanence of death". The established term is "mindfulness of death", not
"recollection of death." → "mindfulness of death" / "death-mindfulness"

### 三级修学 → Three-Level Study Program (WRONG per DoT定稿)

DoT定稿 has "Three-Stage Practice." → "Three-Stage Practice"

### 下士道/中士道/上士道

DoT定稿: "Path for Persons of Small/Medium/Great Capacity" — not "path of the
initial/middle/great scope."

### 观音菩萨 → Avalokiteśvara (AVOID in MPI translations)

佛教术语 has "Guanshiyin/Guanyin Bodhisattva." Use "Guanyin Bodhisattva."

## Workflow pitfall

### Translating before consulting terms DB

Always search key terms BEFORE translating. The dharma-translation skill says to do
this, but it's easy to skip. Use the CLI: `$MPI_PROJECT_ROOT/terms-search/search.py <query>`.
Prioritize DoT定稿 > 内部特色词 > 佛教术语 > 经论名.
