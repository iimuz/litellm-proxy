#!/usr/bin/env bash
#
# curlを利用したchatの動作確認

set -eu
set -o pipefail

readonly MODEL_NAME="phi4-mini"

curl -sS -v --request POST 'http://localhost:4000/chat/completions' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer sk-1234' \
  -d @- << EOF
    {
      "model": "$MODEL_NAME",
      "messages": [
        {
          "role": "system",
          "content": "You are a helpful math tutor. Guide the user through the solution step by step."
        },
        {
          "role": "user",
          "content": "how can I solve 8x + 7 = -23"
        }
      ]
    }
EOF

