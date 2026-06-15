# Translation Pitfalls — MPI Buddhist Texts

Patterns found in CN→EN translation review. Add to this file as new patterns emerge.

## Terminology conflation

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

## False implication

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
this, but it's easy to skip. Use the CLI: `/home/user/documents/mpi/terms-search/search.py <query>`.
Prioritize DoT定稿 > 内部特色词 > 佛教术语 > 经论名.
