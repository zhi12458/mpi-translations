# Sol Medium 稳健版与限定风格优化版对比报告

## 结论先行

当前采用 **M3 限定风格优化版** 作为 M 策略 1.0 的验证基线；M2 保留为稳健历史对照稿。

两位独立裁判都选择 M3。盲评分对应 L344 最终修订前的 M3；此后 L344 已修复单复数、动作时序、`your company` 和 `that twenty percent` 的回指，并经 V4 Pro/max 第三轮定向复核确认无 critical/major blocker。M3 仍标记为 AI draft，正式出版需要具名人工佛学翻译审核。

## 控制变量

- 中文源文完全相同：378 行，SHA-256 `09e326b291653c0c3c321a1ef1eee81ad6742a9609bb4435a800e82229a22e98`。
- 复用既有 DeepSeek V4 Flash 源义分析，没有重复生成。
- 两稿使用相同术语约束与固定译名：`济群法师 → Master Jiqun`，`大道大商 → Great Path, Great Business`。
- M3 最终改动 21 行，其余 357 行与 M2 完全一致。

## 评分

| 独立裁判 | M2 稳健版 | M3 风格版 | 偏好 |
|---|---:|---:|---|
| DeepSeek V4 Pro Max | 92.0 | 93.0 | M3 +1.0 |
| GPT-5.6 Sol High | 95.6 | 96.9 | M3 +1.3 |

以下分数评测的是 L344 最终收口前的盲评稿（M3 SHA-256 `d76d55a85ca06eb39f6531d9963e674e70dcc49bd821bac593659ec5e20dcb03`），不得冒充当前最终 M3 的重新评分。V4 Pro 分项如下：

| 分项 | M2 | M3 | 观察 |
|---|---:|---:|---|
| 准确完整性 | 34 | 33 | M2 +1 |
| 佛法义理与术语 | 19 | 19 | 持平 |
| 英文简洁可读 | 16 | 18 | M3 +2 |
| 人物声音与出版语域 | 13 | 14 | M3 +1 |
| 标题与小标题 | 10 | 9 | M2 +1 |

GPT-5.6 Sol High 分项如下：

| 分项 | M2 | M3 | 观察 |
|---|---:|---:|---|
| 准确完整性 | 34.4 | 34.0 | M2 +0.4 |
| 佛法义理与术语 | 19.5 | 19.5 | 持平 |
| 英文简洁可读 | 18.5 | 19.3 | M3 +0.8 |
| 人物声音与出版语域 | 13.7 | 14.3 | M3 +0.6 |
| 标题与小标题 | 9.5 | 9.8 | M3 +0.3 |

两个裁判一致认为：M3 的主要收益是自然、简洁、现场语言更顺；M2 的主要优势是字面完整和保守。

## 主要人工争议点

1. **L14 小标题**：M2 `Audience Interaction, Solving Problems` 更贴字面；M3 `Audience Q&A: Addressing Practical Concerns` 更像英文活动标题，但把“互动”收窄为 Q&A，并增加了 `Practical`。
2. **L75 亲近善知识、日久见功**：M3 的 `learn in the presence of ... only sustained effort will bear fruit` 明显更自然；M2 更贴字面但搭配生硬。建议优先考虑 M3。
3. **L79 主持人的现场幽默**：M2 严格保留“不是来当主持”，M3 用 `not merely to moderate` 照顾他事实上正在主持的语境，却轻微弱化原文夸张。需要人工判断幽默忠实度。
4. **L271 牛头不对马嘴**：M2 直译保留意象，却对英文读者不够直接；M3 `completely off the mark` 即时可懂但失去牛马意象。V4 Pro 盲评将 M2 此处判为 major，全文门禁则未判阻断，说明这是最需要人工定夺的一处。
5. **L320 正本清源**：M2 信息更展开，M3 `return to its roots and recover its basic functions` 更凝练。建议以 M3 为底，但人工确认“正本清源”的纠偏意味是否保留充分。
6. **L354 盲修瞎炼**：M2 明说 `mechanically and superficially`，信息更全；M3 用 `go through the motions` 更自然，但压缩了“机械、流于表面”的双重强调。
7. **L344 百分之二十的循环使用**：最终 M3 明确为 `your company` 和 `I will keep that twenty percent circulating`，并保留单数受助者及“进入经商后归还本金”的时序。V4 Pro/max 定向复核已 clear。

## 长度对比

- M2：11,717 个空白分词，71,086 个字符。
- 最终 M3：11,709 个空白分词，70,824 个字符。
- M3 少 8 词、262 字符；它的优势不是大幅缩短全文，而是 21 个局部句子的搭配和节奏更自然。

## 复核状态

- DeepSeek V4 Flash 全文双语复核：两稿均无阻断项；发现项均为 minor 风格建议。
- DeepSeek V4 Pro 标题/major 最终门禁：两稿均 clear。
- 双盲比较：两位裁判均将 M3 排在 M2 之前。
- L344 V4 Pro/max 定向终审：第三轮 clear，critical/major blocker 为 0。
- 机械 QA：没有 FAIL；目录页码和宽泛术语计数仍以 WARN 记录，发布治理因 AI draft 保持 SKIP。题名检查已改为 Djot 锚点感知。
- 状态仍为 `AI draft`，最终公开定稿需具名佛法审校人确认。

## 文件校验值

- M2 target: `e5d20f97e9746a495cf64dfcab2563c9c95ef3da2b531aec7852641b33fb686d`
- M3 target: `5ca852fbbaba9ac799e01d965e38f1ed65a3dc1e0e15ccebb9629e85ac63c889`
- M2 bilingual: `40ad9f10de7a07f46d6f0bd24693e2cbf0689436b6f8ed824e0061c46fb31d9d`
- M3 bilingual: `15d98391e0841b13e897fe0a27f9e975954e987df6a7c0ebf6afe875bba9a93e`
