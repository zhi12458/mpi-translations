#!/usr/bin/env python3
"""Remove Djot anchor-only paragraphs that Pandoc exposed in DOCX output."""

from __future__ import annotations

import argparse
import os
import re
import tempfile
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile

from lxml import etree


W = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
NS = {"w": W}
ANCHOR = re.compile(r"^\s*\{#[^{}]+\}\s*$")


def clean(path: Path) -> int:
    path = path.resolve()
    removed = 0
    fd, temp_name = tempfile.mkstemp(prefix=f".{path.stem}.", suffix=".docx", dir=path.parent)
    os.close(fd)
    temp = Path(temp_name)
    try:
        with ZipFile(path, "r") as source, ZipFile(temp, "w", ZIP_DEFLATED) as target:
            for item in source.infolist():
                data = source.read(item.filename)
                if item.filename == "word/document.xml":
                    root = etree.fromstring(data)
                    for para in list(root.xpath(".//w:p", namespaces=NS)):
                        text = "".join(para.xpath(".//w:t/text()", namespaces=NS))
                        if ANCHOR.fullmatch(text):
                            parent = para.getparent()
                            if parent is not None:
                                parent.remove(para)
                                removed += 1
                    data = etree.tostring(
                        root,
                        xml_declaration=True,
                        encoding="UTF-8",
                        standalone=True,
                    )
                target.writestr(item, data)
        os.replace(temp, path)
    finally:
        if temp.exists():
            temp.unlink()
    return removed


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("docx", type=Path, nargs="+")
    args = parser.parse_args()
    for docx in args.docx:
        print(f"{docx}: removed {clean(docx)} anchor-only paragraphs")


if __name__ == "__main__":
    main()
