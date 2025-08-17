#!/usr/bin/env bash
#MISE description="Run LiteLLM proxy server."

set -eu
set -o pipefail

echo "Run LiteLLM proxy server."

uv run litellm --config ./src/config.yaml
