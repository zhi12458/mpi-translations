# Bilingual DJ Format

## Layout

Each pair: source line immediately followed by target line. Blank line separates pairs.

```
source-line
target-line

source-line
target-line
```

NOT:
```
source-line
              ← WRONG: extra blank between source and target
target-line
```

## Creating initial bilingual from source only

Every source line gets an empty target placeholder + blank separator:

```
source-A

source-B
```

(2 blank lines between consecutive source lines: empty target + separator.)

## Verification

Source line count × 3 − 1 = bilingual line count (before trailing newline strip).
