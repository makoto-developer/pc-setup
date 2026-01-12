# macOS開発環境構築

## `iterm2`をインストール

ここ↓からitem2をインストール

https://iterm2.com/

※macOS純正のterminalは`brew`がうまく機能しない場合があるので`iterm2`を使う

## `brew`をインストール

ここ↓から`brew`をインストールするか、コマンドでインストール

https://brew.sh/

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 作業ディレクトリを作成しておく

```shell
mkdir -p ~/work/github ~/work/gitlab ~/opt ~/tmp
```

- `~/work`はGithubや個人開発のプロジェクトを管理する領域
- `~/opt` -> `Go`製のコマンドなど、手動でダウンロードしてローカルで使う時に配置するディレクトリ
- `~/tmp` -> 中間ファイルや一時的な作業場でいつでも消えて問題ないディレクトリ

## 必要なツールをインストール

方針
- ツールは可能な限りbrewでインストール
- プログラミング言語はasdfで管理
  - 例外として、バージョンを揃えた方がいいツールはasdf
- brewでインストールする前に必ずhomebrewホームページを見て開発元を確認 -> https://brew.sh/ja/

caskでインストール可能なappの一覧はこちら -> https://github.com/Homebrew/homebrew-cask/tree/master/Casks


```shell
brew update
# 不要なキャッシュ削除
brew cleanup
```

必須アプリ

```shell
brew install --cask google-chrome
brew install --cask google-japanese-ime
brew install --cask clipy
brew install --cask alt-tab
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask chromium
brew install --cask notion
brew install --cask discord
brew install --cask openlens
brew install --cask postman
brew install --cask firefox
brew install --cask microsoft-edge
brew install --cask docker
```

```shell
brew install gh
brew install git-lfs
brew install terraform
```

SQLのフォーマッターはこれに統一している

```shell
brew install sql-formatter
```

必要であれば入れるアプリ

```shell
brew install --cask warp
brew install --cask slack
brew install --cask itsycal
brew install --cask figma
brew install --cask kindle
brew install --cask skype
brew install --cask zoom
brew install --cask wireshark
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

Caskで入らないアプリ

```text
Google Drive (https://workspace.google.com/products/drive/#download)
One Drive(https://www.microsoft.com/ja-jp/microsoft-365/onedrive/online-cloud-storage)
```

強化版コマンド

```shell
# これがあれば統合エディタは不要
brew install nvim
# 履歴から使いたいコマンドを探す
brew install peco
# gitのCUIの見た目をよくしてくれる
brew install tig
# lessの代替
brew install bat
# リアルタイムなプロセス表示
brew install htop
# findの高速版
brew install fd
# grepを高速化、正確
brew install ripgrep
```

コマンド

```shell
# ローカルで簡単にKubernetes Clusterを作るコマンド
brew install kind
```

ghqの設定で必要なコマンド

```shell
brew install ghq fzf hstr
```

## Google Driveを入れる

インターネットでGoogle Drive macOSで検索してインストール。同期してバックアップファイルを取得する。

## セキュリティソフト

必要なら入れる

## 開発用のフォントをインストール

こちら↓を参照

https://github.com/yuru7/HackGen

```
brew tap homebrew/cask-fonts
brew install font-hackgen font-hackgen-nerd
```

## power fontをインストール(preztoのテーマの設定で必要になるの今のうちに入れる)

1. 公式↓を参考にインストール

https://github.com/powerline/fonts

```sehll
git clone https://github.com/powerline/fonts.git --depth=1

cd fonts
./install.sh

cd ..
rm -rf fonts
```

2. `poworline-shell`をインストール

https://github.com/b-ryan/powerline-shell

[!TIP]
`asdf install python 3.9.18`でインストールしたのち、`python setup.py install`を実行。
macos m1だpython v2系がなくなったので手順書通りやってもできない可能性が高い。


## Gitのバージョンを上げる

こちら↓を参考に

https://qiita.com/normalsalt/items/f200ba50363ebfd46df0

```shell
brew install git
```

## sshを設定

```shell
$ brew install git-delta
$ cd ~
$ mkdir .ssh
$ cd .ssh
$ ssh-keygen -t ed25519 -C "GitHub(makoto-developer)" -f ~/.ssh/id_github_20251006_ed25519

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
pbcopy < ~/.ssh/id_github_20251006_ed25519.pub
# ssh configを設定
touch ~/.ssh/config

vi ~/.ssh/config
# 中身は↓のように
Host github.com
  HostName github.com
  User <<<your name>>>
  Port 22
  IdentityFile ~/.ssh/id_github_20251006_ed25519
  IdentitiesOnly yes

# 疎通確認
ssh -T git@github.com

# パスフレーズの入力を省略
ssh-add -K ~/.ssh/id_github_20251006_ed25519

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
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# fish shell configを作成
mv ~/.config/fish/config.fish ~/.config/fish/config.fish.org
mv ~/.config/fish/conf.d ~/.config/fish/conf.d.org
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/
ln -s ~/dotfiles/fish/init.fish ~/.config/fish/
ln -s ~/dotfiles/fish/conf.d  ~/.config/fish/

```

## バージョン管理ツール

```shell
brew install mise
```

install

```shrll
cd ~
# https://github.com/makoto-developer/dotfilesを参照
ln -s ~/dotfiles/asdf/.tool-versions ~
mise i
```

### 動作確認

以下のコマンドが使えるかチェック

```shell
iex version
erl version
node -v
go version
rustc -V
```

# Elixir Phoenix インストール

公式サイトを参考にインストールする(https://hexdocs.pm/phoenix/installation.html)

```shell
mix archive.install hex phx_new
```

コマンドが使えるか確認

```shell
mix
```

# chromeの拡張で入れているもの

脆弱性が心配なのでほとんど何も入れてない

## Rancher DeskTopを入れる

~~lima やめた~~
Rancher Desktopが便利(.docker_lima.mdに移動)

まずはdockerを入れる

```shell
brew install docker docker-compose
```

`Rancher DeskTop`をインストール

```shell
brew install --cask rancher
```

Non-Commercial(非商用利用)であればDocker Desktopで問題ない

```text
brew install --cask docker
```


# macOS Systemの設定

- 言語を英語(US)に変更する
- ファイヤーウォールをONにする
- Caps Lockをctrlに変更する
- 時間
  - 秒を表示する
  - 24時間表示にする
- メニューバーにバッテリーの残量を表示する
- メニューバーにボリュームを表示する
- siriは無効化する
- Mission Controlにある使わないアプリはひとつにまとめて削除
- ホットコーナーを無効化する
- spotlight
  - アプリケーションとシステム環境設定以外はすべて無効化
  - ショートカットを`ctrl + space`に変更
- キーボード
  - 数字の全角入力をオフにする
  - シングルクォーテーション、ダブルクオーテーションの自動変換をオフにする
  - スペルの自動変換をオフにする
