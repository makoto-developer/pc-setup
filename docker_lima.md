# Docker + Lima構築方法

2023/10/1時点ではRancher Desktopが登場してこの方法で構築することはなくなった。手順はここに残しておく。

```shell
brew install docker docker-compose
```

(参考リンク)[https://qiita.com/mykysyk@github/items/26926aa98c1591b2f1ed]

```shell
brew install lima docker docker-compose
cd ~
mkdir -p ~/.docker/cli-plugins
ln -sfn /usr/local/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

# docker-composeが実行できることを確認(空打ち)
docker-compose

# limactlが実行できることを確認
limactl -v

# limaの公式からdockerイメージをダウンロード
LIMA_VERSION=`limactl -v | awk '{print $3}'`
curl -o docker.yaml https://raw.githubusercontent.com/lima-vm/lima/v${LIMA_VERSION}/examples/docker.yaml

# dockerを起動
limactl start ./docker.yaml

## 初回尋ねられるので `Proceed with the default configuration`を選択
## ? Creating an instance "default"  [Use arrows to move, type to filter]
## > Proceed with the default configuration
## Open an editor to override the configuration

# zshrcにDockerHostを追加
echo 'export DOCKER_HOST=unix://$HOME/.lima/docker/sock/docker.sock' >> ~/.zshrc
source  ~/.zshrc

# dockerの疎通ができることを確認
docker ps --all

# お試しでNginxが起動できるかどうかを確認(やらなくてもいい)
docker pull nginx
docker run --name start-nginx -d -p 8080:80 nginx
docker ps -a
```

[localhost:8080](http://localhost:8080)を開いてNginxが動いていることを確認

確認が終わったら終了する

```shell
docker stop start-nginx
```


