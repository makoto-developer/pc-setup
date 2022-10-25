# macOS開発環境構築

## 将来的に実現したいこと

- terraformで全自動で環境構築できるようにしたい

## 前提

- 基本的にアプリインストールは`brew cask`でインストールする

## iterm2をインストール

[ここ](https://iterm2.com/)からitem2をインストール

https://iterm2.com/

## [brew](https://brew.sh/index_ja)をインストール

コマンドを実行する

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
mkdir ~/work ~/opt
```

## 必要なツールをインストール

GUIアプリ


その1 よく使うツール

```shell
# caskでインストール可能なappの一覧はこちら -> https://github.com/Homebrew/homebrew-cask/tree/master/Casks
brew install --cask clipy
brew install --cask alt-tab
brew install --cask rectangle
brew install --cask itsycal
brew install --cask notion
brew install --cask kindle
brew install --cask discord
brew install --cask karabiner-elements
brew install --cask figma
brew install --cask slack
brew install --cask jetbrains-toolbox
brew install --cask ngrok
```

その2 必要であれば入れるツール

```shell
brew install --cask skype
brew install --cask zoom
brew install --cask visual-studio-code
brew install --cask wireshark
brew install --cask chromium

# office series
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

**その他GUI (homebrew/cask-drivers)**

```shell
# cask-driverでインストール可能なappの一覧はここから -> https://github.com/Homebrew/homebrew-cask-drivers/tree/master/Casks
brew tap homebrew/cask-drivers
brew install zsa-wally
```

**コマンド**

```shell
# other
brew install jq
brew install ghq
brew install peco
brew install htop
brew install colordiff
brew install nkf
brew install fig
brew install wget
brew install tree

# kubernetes
brew install kubectx
brew install kubernetes-cli
brew install helm
```

**aws**
```shell
# cask-drivers
brew tap homebrew/cask-drivers
brew install localstack


# default
brew install --cask dynamodb-local
brew install --cask aws-vault
brew install saml2aws
brew install kube-aws
brew install aws-apigateway-importer
brew install aws-auth
brew install aws-cdk
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
brew install awscli
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

## 開発用のフォントをインストール

[こちら](https://github.com/yuru7/HackGen)を参照

```
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd
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
```


# 設定編

## iterm

itermのprofileから↓のパスの設定ファイルをimportする

```shell
~/dotfiles/iterm/
```

## `cmd + enter`で最大化しないようにする

```text
Keys -> Key Bindings -> +ボタン -> 'CMD + ENTER' is disabled`
```

## キーボード設定

<img width="630" alt="image" src="https://user-images.githubusercontent.com/72484465/182054276-ca00b1e0-840e-4bc8-9205-e2e09a0aab18.png">

## キーリピート設定変更

```shell
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1
# 緊急時、元に戻すコマンド
defaults delete -g InitialKeyRepeat
defaults delete -g KeyRepeat
```

## zshの設定

### preztoをインストール

[公式サイト](https://github.com/sorin-ionescu/prezto)をみながらインストール

preztoをインストール

```shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

インストールが終わったら↓のコマンドを実行

```shell
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

preztoのシンボリックをバックアップ(削除でもOK)

```shell
mv .zshrc .zshrc_zprezto_original
```

dotfilesのシンボリックを貼り直す

```shell
ln -s dotfiles/zsh/zshrc ~/.zshrc
ln -s dotfiles/zsh/.zsh_profile ~/.zsh_profile
```

[ここを参照](https://github.com/sorin-ionescu/prezto/tree/master/modules)して必要なテーマを入れる

```shell
vi .zpreztorc

# 30行目あたりに以下を追加
   'docker' \
   'git' \
   'haskell' \
   'homebrew' \
   'node' \
   'python' \
   'ssh' \
   'syntax-highlighting' \
```

エディタをvimに変更する

```shell
vi ~/.zprofile

#
# Editors
#

export EDITOR='nano' # <-- viにする
export VISUAL='nano' # <-- viにする
export PAGER='less'
```

preztoのテーマを変更する

```shell
vi .zpreztorc

#  128行目辺り
#zstyle ':prezto:module:prompt' theme 'sorin'
zstyle ':prezto:module:prompt' theme 'agnoster'
```

```shell
mv ~/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme ~/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme-original
ln -s ~/dotfiles/zsh/agnoster.zsh-theme  ~/.zprezto/modules/prompt/external/agnoster/
```


## バージョン管理ツールインストール

[こちらを参照](https://asdf-vm.com/#/core-manage-asdf)

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

Elixirのバージョンを確認

```shell
asdf list all elixir
```

最新のElixirを入れる

```shell
asdf install elixir 1.13.2-otp-24
```

インストールしたのElixirのバージョンを確認

```shell
asdf list elixir
```

Elixirを使えるようにする

```shell
asdf global elixir 1.13.2-otp-24
```

プロジェクトごとに固定にする場合はlocalを使う

```shell
asdf local elixir 1.13.2-otp-24
```

### Erlangインストール

elixirと同じく、インストール可能なElixirバージョンを確認

```shell
asdf list all erlang
```

最新のErlangを入れる

```shell
asdf install erlang 24.2.1
```

インストール済みのErlangのバージョンを確認

```shell
asdf list erlang
```

Erlangを使えるようにする

```shell
asdf global erlang 24.2.1
```

プロジェクトごとに固定にする場合はlocalを使う

```shell
asdf local erlang 24.2.1
```

### 動作確認

以下のコマンドが使えるかチェック

```shell
iex
erl
mix
```

### Phoenixインストール

```shell
mix archive.install hex phx_new
```

## vimの設定

jetbrains製品でも同じvimの設定を共有する

```shell
ln -s ~/dotfiles/vim/.vimrc ~/.ideavimrc
```

## Node.jsインストール

###  インストール可能なバージョンを確認

```shell
asdf list all nodejs
```

### nodejsをインストール

```shell
set NODE_VERSION=16.17.1
asdf install nodejs $NODE_VERSION
```

### バージョンを固定化

グローバルで固定にするとき

```shell
asdf global nodejs $NODE_VERSION
```

プロジェクトごとに固定化するとき

```shell
asdf local nodejs $NODE_VERSION
```


# chromeの拡張で入れているもの

- Octotree GitHub code tree (githubにtree形式でフォルダ構造がみえるようにする)
- vimium (vimライクにchromeの移動が可能
- ColorPick Eyedropper (画面のドットの色を抽出)
- Fonts Ninja (画面で見えているフォントを調べる)


## docker + lima環境構築

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

## twty

カフェとかで画面見られたときに恥ずかしい(セキュリティ的にもアウトか)のでcliで投稿できるようにしたいため導入

```shell
brew install twty
```

[how_to_use_twty.md](./how_to_use_twty.md)

## golang インストール

```shell
# TODO 記載する
asdf plugin add golang
asdf install golang 1.9
asdf global golang 1.9

# 環境変数を設定
## TODO 追記する
```

## npmで入れておくもの

```shell
node -v
npm i -i yarn
```


# macOSの設定

- 端末の名前を変更する
- ファイヤーウォールをONにする
- マウスカーソルの速度を最大にする
- トラックパッドの速度を最大にする
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
  - すケースエフェクトでウィンドウをしまう
- スクリーンショットの保存先を変更する

↓のコマンドを実行する

```shell
defaults write com.apple.screencapture location ~/Screenshot/;killall SystemUIServer
```

- Finder
  - 左ナビバーにホームディレクトリを追加
  - Air Dropを削除
  - 不要なディレクトリを削除
  - 拡張子を表示する
  - 隠しファイル/ディレクトリを表示する(`cmd + shift + .`)
- ホットコーナーを無効化する
- スクリーンショット撮影後にサムネイルを表示しない

`cmd + shift + 5`でスクリーンショットを出す。オプションを選択して「フローティングサムネールを表示」をクリックしてオフにする

- スクリーンショットの影を消し、ファイルサイズを小さくする

```shell
defaults write com.apple.screencapture disable-shadow -bool TRUE
defaults write com.apple.screencapture type JPG
killall SystemUIServer
```


- spotlight
  - アプリケーションとシステム環境設定以外はすべて無効化
  - ショートカットを`ctrl + space`に変更
- キーボード
  - 数字の全角入力をオフにする
  - シングルクォーテーション、ダブルクオーテーションの自動変換をオフにする
  - スペルの自動変換をオフにする
  - 


## vim設定

[dein](https://github.com/Shougo/dein.vim/blob/master/README.md)

```shell
brew install neovim

# この手順は→のURLを参照する https://github.com/Shougo/dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

# これはやらなくてもいいかも
python3 -m pip install --user --upgrade pynvim

ln -s ~/dotfiles/vim/nvim ~/.config/nvim
```

## gqh


```shell

git config --global ghq.root '~/work'
```
