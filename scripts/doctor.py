#!/usr/bin/env python3
"""Read-only MPI repository doctor for the audited Strategy C runtime."""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
TOOLKIT = ROOT / "toolkit"


def run(*args: str, cwd: Path = ROOT) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        args,
        cwd=cwd,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--strategy-c", action="store_true", required=True)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    checks: list[dict[str, object]] = []
    for relative in ("AGENTS.md", "strategy-c-release.json", "toolkit/AGENTS.md"):
        path = ROOT / relative
        checks.append({"name": f"file:{relative}", "ok": path.is_file(), "path": str(path)})

    submodule = run("git", "submodule", "status", "--", "toolkit")
    expected = ""
    actual = ""
    status = submodule.stdout.rstrip("\r\n")
    marker = status[:1]
    if submodule.returncode == 0 and status.strip():
        actual = status[1:41] if marker in {" ", "-", "+", "U"} else status.split()[0]
        pointer = run("git", "ls-tree", "HEAD", "toolkit")
        if pointer.returncode == 0 and pointer.stdout.strip():
            expected = pointer.stdout.split()[2]
    checks.append(
        {
            "name": "toolkit-submodule-pointer",
            "ok": bool(expected) and actual == expected and marker not in {"-", "+", "U"},
            "expected": expected,
            "actual": actual,
        }
    )

    toolkit_doctor = run(
        sys.executable,
        str(TOOLKIT / "scripts" / "doctor.py"),
        "--strategy-c",
        "--json",
        cwd=TOOLKIT,
    )
    toolkit_report: object
    try:
        toolkit_report = json.loads(toolkit_doctor.stdout)
    except json.JSONDecodeError:
        toolkit_report = {"stdout": toolkit_doctor.stdout[-500:]}
    checks.append(
        {
            "name": "toolkit-doctor",
            "ok": toolkit_doctor.returncode == 0,
            "exit_code": toolkit_doctor.returncode,
            "report": toolkit_report,
            "stderr": toolkit_doctor.stderr[-500:],
        }
    )

    report = {"mode": "strategy-c", "ok": all(bool(item["ok"]) for item in checks), "checks": checks}
    if args.json:
        print(json.dumps(report, ensure_ascii=False, indent=2))
    else:
        for item in checks:
            print(("PASS" if item["ok"] else "FAIL") + " " + str(item["name"]))
    return 0 if report["ok"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
