# macOS開発環境構築

## iterm2をインストール

[ここ](https://iterm2.com/)からitem2をインストール

https://iterm2.com/

※macOS純正のterminalを使うとbrewがうまく機能しない場合があるので`iterm2`を使う

## [brew](https://brew.sh/index_ja)をインストール

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 必須ツール

### brewでインストール

```shell
brew install --cask google-chrome
brew install --cask google-japanese-ime
```

### Googleで検索してインストール

```text
カスペルスキー(会社で指定されていなかったら入れておく)
```

### Apple Storeからインストール

```text
Line App
XCode
```

## ディレクトリを作成しておく

```shell
mkdir -p ~/work/github ~/opt
```

## よく使うツールをインストール

**GUIアプリ**

その1 よく使うツール

```shell
# caskでインストール可能なappの一覧はこちら -> https://github.com/Homebrew/homebrew-cask/tree/master/Casks
brew install --cask clipy
brew install --cask alt-tab
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask chromium
```

必要であれば入れるツール1

```shell
brew install --cask itsycal
brew install --cask notion
brew install --cask kindle
brew install --cask discord
brew install --cask figma
brew install --cask slack
brew install --cask ngrok
```

必要であれば入れるツール2

```shell
# online meeting
brew install --cask skype
brew install --cask zoom

# Network
brew install --cask wireshark

# office
brew install --cask microsoft-excel
brew install --cask microsoft-office
brew install --cask microsoft-openjdk
brew install --cask microsoft-outlook
brew install --cask microsoft-powerpoint
brew install --cask microsoft-remote-desktop
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask android-file-transfer
```

**コマンド**

よく使うコマンド

```shell
# other
brew install gitmoji
brew install ghq
brew install fzf
brew install peco
```


```shell
# other
brew install gitmoji
brew install jq
brew install htop
brew install colordiff
brew install nkf
brew install fig
brew install wget
brew install tree
```

kubernetes

```shell
# kubernetes
brew install kubectx
brew install kubernetes-cli
brew install helm
```

aws

```shell
# cask-drivers
brew tap homebrew/cask-drivers
brew install localstack

# default
brew install aws-cdk
brew install saml2aws
brew install awscli
brew install --cask dynamodb-local
brew install --cask aws-vault
brew install kube-aws
brew install aws-apigateway-importer
brew install aws-auth
brew install aws-cfn-tools
brew install aws-console
brew install aws-elasticbeanstalk
brew install aws-es-proxy
brew install aws-google-auth
brew install aws-iam-authenticator
brew install aws-keychain
brew install aws-nuke
brew install aws-okta
brew install aws-rotate-key
brew install aws-sdk-cpp
brew install aws-shell
brew install aws-sso-util
brew install aws-vault
brew install aws2-wrap
brew install awscli@1
brew install awscurl
brew install awslogs
brew install awsume
```

mas(Apple Store上のアプリをコマンドラインからインストールできる)

```shell
# mas-cliをインストール
brew install mas

# インストール済み
mas list

# 探す
mas search <search app name>

# install
mas install <app id>

mas install 539883307 # LINE
```

負荷試験ツール

```bash
brew install jmeter

```

## 開発用のフォントをインストール

[こちら](https://github.com/yuru7/HackGen)を参照

```
brew tap homebrew/cask-fonts
brew install font-hackgen  font-hackgen-nerd
```

## power fontをインストール(preztoのテーマの設定で必要になるの今のうちに入れる)

[公式](https://github.com/powerline/fonts)を参考にインストール

```sehll
git clone https://github.com/powerline/fonts.git --depth=1

cd fonts
./install.sh

cd ..
rm -rf fonts
```

## Gitのバージョンを上げる

[こちらを参考に](https://qiita.com/normalsalt/items/f200ba50363ebfd46df0)

```shell
brew install git
```

## sshを設定

```shell
$ cd ~
$ mkdir .ssh
$ cd $_
$ ssh-keygen -t ed25519 -C "<<<your email>>>"

# Generating public/private ed25519 key pair.
# Enter file in which to save the key (/Users/user/.ssh/id_ed25519): id_github <<<githubを例に。ドメインごとにsshkeyを作成する。流用しない。>>>
# Enter passphrase (empty for no passphrase): <<<パスフレーズを設定(Githubでは設定することを推奨している)>>>
# Enter same passphrase again: <<<パスフレーズを設定(Githubでは設定することを推奨している)>>>
# Your identification has been saved in id_github
# Your public key has been saved in id_github.pub
# The key fingerprint is:
# The key's randomart image is:
# +--[ED25519 256]--+
# |                 |
# |                 |
# |                 |
# |                 |
# |                 |
# |                 |
# |             ..  |
# +----[SHA256]-----+

# コピーしてsshキーをgithubに登録
pbcopy < ~/.ssh/id_github.pub
# ssh configを設定
touch ~/.ssh/config

vi ~/.ssh/config
# 中身は↓のように
Host github.com
  HostName github.com
  User <<<your name>>>
  Port 22
  IdentityFile ~/.ssh/id_github
  IdentitiesOnly yes

# 疎通確認
ssh -T git@github.com

# パスフレーズの入力を省略
ssh-add -K ~/.ssh/id_github

# 登録できたか確認
ssh-add -l
```

## dotfilesを取得して、READMEに従って設定する

```shell
git clone git@github.com:makoto-developer/dotfiles.git

# README.mdをみて設定をする
```

## iterm

itermのprofileから↓のパスの設定ファイルをimportする

```shell
~/dotfiles/iterm/
```

`cmd + enter`で最大化しないようにする

```text
Keys -> Key Bindings -> +ボタン -> 'CMD + ENTER' is disabled`
```

itermのフォントをpowerlineのフォントに変更しておく

```text
itermを開いて profiles -> text -> font -> 「power」がつくフォントを選ぶ
```


## キーボード設定

<img width="630" alt="image" src="https://user-images.githubusercontent.com/72484465/182054276-ca00b1e0-840e-4bc8-9205-e2e09a0aab18.png">

## キーリピート設定変更

入力速度を速くする

```shell
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1
# 緊急時、元に戻すコマンド
defaults delete -g InitialKeyRepeat
defaults delete -g KeyRepeat
```

## fish shell

参考: https://zenn.dev/sawao/articles/0b40e80d151d6a

```shell
brew install fish

# fishを追加
sudo vi /etc/shells
# 最後に追加 /usr/local/bin/fish

# デフォルトのシェルを変更
chsh -s /usr/local/bin/fish

# パッケージマネージャー
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# 文字化け対策
fisher install oh-my-fish/theme-bobthefish


# oh-my-fishをインストール
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# oh-my-fishのプラグインをインストール
omf install agnoster
omf theme agnoster
ln -s ~/dotfiles/fish/init.fish ~/.config/omf/
```

## langバージョン管理ツール

[こちら](https://asdf-vm.com/#/core-manage-asdf)を参照しながらインストールする。

macOS -> Homebrew 経由でインストール

```shell
sudo xcodebuild -license accept
brew install asdf
```

asdfのパスを通す

```shell
. $(brew --prefix asdf)/asdf.sh
. $(brew --prefix asdf)/libexec/asdf.sh
```

プラグインを入れる(使いそうにないやつは削除)

```shell
asdf plugin add haskell
asdf plugin add erlang
asdf plugin add elixir
asdf plugin add nodejs
asdf plugin add golang
asdf plugin add rust
asdf plugin add zig
asdf plugin add clojure
asdf plugin add julia
```

### Elixirをインストール

```shell
asdf list all elixir
# 最新のバージョンを入れる
asdf install elixir 1.13.2-otp-24
asdf global elixir 1.13.2-otp-24
```

### Erlangインストール

Elixirのopt-xのバージョンを入れる

```shell
asdf list all erlang
asdf install erlang 24.2.1
asdf global erlang 24.2.1
```

### Node.jsインストール

```shell
asdf list all nodejs
asdf install nodejs 16.17.1
asdf global nodejs 16.17.1
```

### golang インストール

```shell
asdf plugin add golang
asdf install golang 1.20.4
asdf global golang 1.20.4

# 環境変数を設定
```
### 動作確認

以下のコマンドが使えるかチェック

```shell
iex
erl
mix
node -v
go version
```

## brewにないツール

https://www.homerow.app/


# chromeの拡張で入れているもの

- Octotree GitHub code tree (githubにtree形式でフォルダ構造がみえるようにする)
- Vimium (vimライクにchromeの移動が可能
- ColorPick Eyedropper (画面のドットの色を抽出)
- Fonts Ninja (画面で見えているフォントを調べる)
- ブックマーク検索 (ブックマークを検索する)


## docker + lima環境構築

brew install docker docker-compose

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


# macOS Systemの設定

- 言語をUSに変更する
- 端末の名前を変更する
- ファイヤーウォールをONにする
- Caps Lockをctrlに変更する
- 時間
  - 秒を表示する
  - 24時間表示にする
- メニューバーにバッテリーの残量を表示する
- メニューバーにボリュームを表示する
- メニューバーからSpotlightとsiriを削除する
- siriは無効化する
- Mission Controlにある使わないアプリはひとつにまとめてどける
- Dock
  - Dockを自動で表示する
  - 不要なアプリをDockから削除する
  - 最近使ったアプリを表示しない
  - 位置を左側に変更する
  - スケールエフェクトでウィンドウをしまう 
- Finder
  - 左ナビバーにホームディレクトリを追加
  - Air Dropを削除
  - 不要なディレクトリを削除
  - 拡張子を表示する
  - 隠しファイル/ディレクトリを表示する(`cmd + shift + .`)
- ホットコーナーを無効化する
- spotlight
  - アプリケーションとシステム環境設定以外はすべて無効化
  - ショートカットを`ctrl + space`に変更
- キーボード
  - 数字の全角入力をオフにする
  - シングルクォーテーション、ダブルクオーテーションの自動変換をオフにする
  - スペルの自動変換をオフにする

スクリーンショットの保存先を変更する

```shell
defaults write com.apple.screencapture location ~/Screenshot/;killall SystemUIServer
```

スクリーンショット撮影後にサムネイルを表示しない

`cmd + shift + 5`でスクリーンショットを出す。オプションを選択して「フローティングサムネールを表示」をクリックしてオフにする

スクリーンショットの影を消し、ファイルサイズを小さくする

```shell
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.screencapture disable-shadow -bool TRUE
defaults write com.apple.screencapture type JPG
killall SystemUIServer
```

## gqh

gqhはローカルにあるリポジトリを探すツール


```shell
brew install ghq
git config --global ghq.root '~/work/github'
brew install fzf
```


## terraform

