#!/usr/bin/env bash
#MISE description="Setup this project."

set -eu
set -o pipefail

echo "setup project root directory"

npm ci
uv sync --extra dev
