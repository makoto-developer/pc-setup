# macOS開発環境構築

## `iterm2`をインストール

ここ↓からitem2をインストール

https://iterm2.com/

※macOS純正のterminalを使っても良いが、`brew`がうまく機能しない場合があるので`iterm2`を使ったほうがよい。

## `brew`をインストール

ここ↓から`brew`をインストールする

https://brew.sh/

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 作業ディレクトリを作成しておく

```shell
mkdir -p ~/work/github ~/work/gitlab ~/opt
```


## `brew`で必要なツールをインストール

必須ツール

```shell
brew install --cask google-chrome
brew install --cask google-japanese-ime
```
## makoto-developerが入れているツール

GUIアプリ

caskでインストール可能なappの一覧はこちら -> https://github.com/Homebrew/homebrew-cask/tree/master/Casks

```shell
brew install --cask clipy
brew install --cask alt-tab
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask chromium
brew install --cask notion
brew install --cask discord
brew install --cask slack
```

必要であれば入れる

```shell
# デザイン
brew install --cask itsycal
brew install --cask figma

# Amazon
brew install --cask kindle

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

ナウでヤングなコマンド

```shell
# other
brew install ghq
brew install fzf
brew install peco
brew install tig
brew install bat
brew install exa
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

~~mas(Apple Store上のアプリをコマンドラインからインストールできる)~~

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

`Apple Store`からインストール

```text
Line App
XCode
```


## セキュリティソフトを入れる

入れても、入れなくてもどっちでもいいが。念の為入れておく。

```text
カスペルスキー(会社で指定されていなかったら入れておく)
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

## Fish shell

参考: https://zenn.dev/sawao/articles/0b40e80d151d6a

```shell
brew install fish

# fishを追加
sudo vi /etc/shells
# 最後に追加 /usr/local/bin/fish

# デフォルトのシェルを変更
chsh -s /usr/local/bin/fish

# fish shell configを作成
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/
ln -s ~/dotfiles/fish/init.fish ~/.config/omf/
ln -s ~/dotfiles/fish/conf.d/  ~/.config/fish/


# パッケージマネージャー(fisher)
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

## バージョン管理ツール

こちら↓を参照しながらインストールする。

https://asdf-vm.com/#/core-manage-asdf


```shell
sudo xcodebuild -license accept
brew install asdf
```

~~asdfのパスを通す~~ `config.fish`に取り込まれているはず

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
# 最新のバージョンを入れる
asdf list all elixir
ASDF_ELIXIR_VERSION=1.15.6-otp-26
asdf plugin add elixir
asdf install elixir $ASDF_ELIXIR_VERSION
asdf global elixir $ASDF_ELIXIR_VERSION
```

### Erlangインストール

Elixirのopt-xのバージョンを入れる

```shell
ASDF_ERLANG_VERSION=26.1.1
asdf plugin add erlang
asdf install erlang $ASDF_ERLANG_VERSION
asdf global erlang $ASDF_ERLANG_VERSION
```

### Node.jsインストール

```shell
ASDF_NODEJS_VERSION=18.18.0
asdf plugin add nodejs
asdf install nodejs $ASDF_NODEJS_VERSION
asdf global nodejs $ASDF_NODEJS_VERSION
```

### golang インストール

```shell
ASDF_GO_VERSION=1.21.1
asdf plugin add golang
asdf install golang $ASDF_GO_VERSION
asdf global golang $ASDF_GO_VERSION
```

### Rust インストール

```shell
ASDF_RUST_VERSION=1.72.1
asdf plugin add rust
asdf install rust  $ASDF_GO_VERSION
asdf global rust  $ASDF_GO_VERSION
```

### 動作確認

以下のコマンドが使えるかチェック

```shell
iex
erl
mix
node -v
go version
rustc
```

# homerow

macOS上の画面に映るあらゆるオブジェクトを選択できるツール

https://www.homerow.app/

ショートカットを`cmd + opt + ctrl + shift + ↓`で設定している

# chromeの拡張で入れているもの

- Octotree GitHub code tree (githubにtree形式でフォルダ構造がみえるようにする)
- Vimium (vimライクにchromeの移動が可能)
- ColorPick Eyedropper (画面のドットの色を抽出)
- Fonts Ninja (画面で見えているフォントを調べる)
- ブックマーク検索 (ブックマークを検索する)

# Chromeのブックマーク

ツールを入れなくても検索可能。

`cmd + l`でアドレスバーに移動、`@ブックマーク <検索したい文字>`で検索できる

ちなみにタブを検索することも可能`@タブ <検索したい文字>`

`@タブ`、`@ブックマーク`など日本語から英語`@tabs`, `@bookmark`にしたい場合は英語版のChromeを入れると可能、らしい。

そんなことしなくても、Chromeの拡張機能`Vimium`を入れれば`o`または`b`を押すだけでブックマークやヒストリーを検索することが可能。

## ~~docker + lima環境構築~~ Rancher DeskTopを入れる

`Rancher DeskTop`があるので現在はこちらを使っている

(.docker_lima.md に過去の手順を残した)

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
- スクリーンショットの保存先を変更する
  - `cmd + shift + 5`でスクリーンショットを出す。オプションを選択して「フローティングサムネールを表示」をクリックしてオフにする

↑全部コマンドで変えることができる。が、一般的な方法でないためテキストで何を変えたかだけ記載する

[macos_setting_disable_animation.md](macos_setting_disable_animation.md)を参照

## gqh

gqhはローカルにあるリポジトリを探すツール

```shell
brew install ghq
git config --global ghq.root '~/work/'
brew install fzf
```

dotfilesリポジトリでシンボリックリンクを貼り付けたので↓の作業は不要。

`vi ~/.config/fish/conf.d/ghq.fish`でファイルを作成して↓を貼り付ける。

```fish
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

# fish key bindings
function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end


function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

# fish key bindings
function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end
```

