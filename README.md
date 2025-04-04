# litellm proxyを利用するためのサンプル

以下の手順で実行することでLiteLLMでproxyしてAPIを利用可能となる。

```sh
pip install -e ".[dev,test]"

# serverが起動するので別プロセスで実行するかバックグラウンドに送る
litellm --config ./src/config.yaml

bash ./src/chat.sh
```
