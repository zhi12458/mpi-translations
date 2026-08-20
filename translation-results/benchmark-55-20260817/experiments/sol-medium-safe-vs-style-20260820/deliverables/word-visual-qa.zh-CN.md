# Word 交付件可视与结构质检

## 结论

- 三份 DOCX 均可正常解包，未发现损坏。
- M2、M3 均通过工具包 `check-docx.py` 的 ZIP 完整性与全文文本一致性检查；检查使用去除 10 行纯技术锚点后的渲染输入副本，原始审计双语稿未改动。
- macOS Quick Look 预览确认中文正文存在且可显示；可见 Djot 锚点计数为 0。
- LibreOffice 渲染共 63 页：M2 27 页、M3 27 页、人工对比稿 9 页。
- 已逐页检查全部 63 页，未见正文、标题、色块或表格越界、重叠、裁切。
- 人工对比稿表格宽度与页面可用宽度一致：总宽 9,360 twip，四列宽度分别为 2,200、1,700、1,700、3,760 twip。

## 文档

- `Great-Path-Great-Business_M2-Safe_Bilingual.docx`：中文在前、英文在后，中英对照全文。
- `Great-Path-Great-Business_M3-Style_Bilingual.docx`：中文在前、英文在后，中英对照全文。
- `Great-Path-Great-Business_M2-vs-M3_Human-Comparison.docx`：仅列 21 处差异（新增最终修订 L344）；每处先列中文，再列 M2 与 M3；M2 差异为红色，M3 差异为绿色。

## 环境说明

LibreOffice 沙箱渲染环境无法读取 macOS 系统中文字体，因此渲染图中的中文显示为空白或方框；这不代表 DOCX 缺少中文。已用 macOS Quick Look 交叉确认三份文档中的中文内容与字体回退均可用。

## 发布边界

本检查只证明文件结构和版面可用，不等同于具名佛法审校人的最终出版批准。
