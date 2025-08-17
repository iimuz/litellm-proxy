# Code Style and Conventions

## Python Code Style (Ruff Configuration)

- **Line length**: 88 characters (same as Black)
- **Indentation**: 4 spaces
- **Quote style**: Double quotes for strings
- **Line ending**: Auto-detect
- **Magic trailing comma**: Respected

## Ruff Linting Rules

- **Enabled**: ALL rules (`select = ["ALL"]`)
- **Ignored rules**:
  - `D203`: one-blank-line-before-class (conflicts with D211)
  - `D213`: multi-line-summary-second-line (conflicts with D212)
  - `COM812`: trailing-comma (formatter conflict)
  - `ISC001`: single-line-implicit-string-concatenation (formatter conflict)
- **Fixable**: ALL rules when using `--fix`

## Excluded Directories

- `.vscode`
- `data`

## File Organization

- Source code in `src/` directory
- Configuration files in project root
- Package name: `litellm_proxy`

## Development Tools

- **Type checking**: mypy
- **Linting/Formatting**: ruff
- **Testing**: pytest
- **Spell checking**: cspell
- **Additional formatting**: dprint, prettier
