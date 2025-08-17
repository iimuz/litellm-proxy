#!/usr/bin/env bash
#MISE description="Format."

set -eu
set -o pipefail

echo "Format..."
npx dprint fmt
npx prettier --write "**/*.{yml,yaml}"
# Normalize cspell words: lowercase, sort, unique
jq '.words |= (
  map(ascii_downcase) |
  sort |
  unique
)' .cspell.json >.cspell.json.tmp &&
  mv .cspell.json.tmp .cspell.json
