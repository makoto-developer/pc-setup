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

必須アプリ

```shell
brew install --cask google-chrome
brew install --cask  google-japanese-ime
brew install --cask  clipy
brew install --cask  alt-tab
brew install --cask  rectangle
brew install --cask  karabiner-elements
brew install --cask  jetbrains-toolbox
brew install --cask  visual-studio-code
brew install --cask  chromium
brew install --cask  notion
brew install --cask  discord
brew install --cask  openlens
brew install --cask  postman
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

コマンド

```shell
brew install nvim
brew install ghq
brew install fzf
brew install peco
brew install tig
brew install bat
brew install exa
brew install jupyterlab
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
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# fish shell configを作成
rm ~/.config/fish/config.fish
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/
ln -s ~/dotfiles/fish/init.fish ~/.config/fish/
mv ~/dotfiles/fish/conf.d ~/dotfiles/fish/conf.d.org
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

- 言語を英語(US)に変更する(日本語モードにすると`ctrl + space`で検索がやりにくい。エンジニアなら英語に慣れろ)
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
brew install ghq fzf hstr
git config --global ghq.root '~/work/repositories/'
```
