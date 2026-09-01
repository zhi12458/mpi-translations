#!/usr/bin/env python3
"""Regenerate the clean MPI supporting-material Word template asset."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

from build_supporting_material_docx import (
    PROFILE_ID,
    create_base_template,
    save_deterministic_docx,
)


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--out",
        type=Path,
        default=Path(__file__).resolve().parents[1] / "assets" / "supporting-material-template-v1.docx",
    )
    args = parser.parse_args()
    doc = create_base_template(include_skeleton=True)
    save_deterministic_docx(doc, args.out)
    print(f"created {args.out}")
    print(f"profile {PROFILE_ID}")
    print(f"sha256 {sha256(args.out)}")


if __name__ == "__main__":
    main()
