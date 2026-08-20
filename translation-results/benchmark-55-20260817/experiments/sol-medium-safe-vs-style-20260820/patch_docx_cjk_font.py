#!/usr/bin/env python3
"""Replace the unavailable DOCX font with a locally renderable CJK font."""

from __future__ import annotations

import argparse
import os
import tempfile
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile


def patch(path: Path, old: str, new: str) -> None:
    path = path.resolve()
    fd, temp_name = tempfile.mkstemp(prefix=f".{path.stem}.", suffix=".docx", dir=path.parent)
    os.close(fd)
    temp = Path(temp_name)
    try:
        with ZipFile(path, "r") as source, ZipFile(temp, "w", ZIP_DEFLATED) as target:
            for item in source.infolist():
                data = source.read(item.filename)
                if item.filename.startswith("word/") and item.filename.endswith(".xml"):
                    data = data.replace(old.encode("utf-8"), new.encode("utf-8"))
                target.writestr(item, data)
        os.replace(temp, path)
    finally:
        if temp.exists():
            temp.unlink()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("docx", type=Path, nargs="+")
    parser.add_argument("--old", default="Arial Unicode MS")
    parser.add_argument("--new", default="Hiragino Sans GB W3")
    args = parser.parse_args()
    for docx in args.docx:
        patch(docx, args.old, args.new)


if __name__ == "__main__":
    main()
