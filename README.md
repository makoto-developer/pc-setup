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
# other
brew install ghq
brew install fzf
brew install peco
brew install tig
brew install bat
brew install exa
brew install jupyterlab
```

Common lisp

```shell
brew install roswell
```

`Apple Store`からインストール

```text
Line App
XCode
```

## Common Lispの実行環境をつくる

asdfで入れようとしたらsbclコマンドが実行されない、というか実行ファイルが存在しない。直し方がわからないので`brew`で入れている。


```sehll
asdf plugin-add sbcl https://github.com/smashedtoatoms/asdf-sbcl.git
asdf install sbcl 2.5.1
asdf set -u sbcl 2.5.1
```


```sehll
brew install sbcl
```

## Google Driveを入れる

インターネットでGoogle Drive macOSで検索してインストール。同期してバックアップファイルを取得する。

## セキュリティソフトを入れる

必要であれば入れる

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

# fishを追加
sudo vi /etc/shells
# 最後に追加 /usr/local/bin/fish

# デフォルトのシェルを変更
chsh -s /usr/local/bin/fish

# fish shell configを作成
rm ~/.config/fish/config.fish
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/
ln -s ~/dotfiles/fish/init.fish ~/.config/fish/
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
brew install asdf
```

asdfのパスを通す

(`config.fish`に取り込まれているはず)

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
asdf plugin add terraform
asdf plugin add bun
```

install

```shrll
cd ~
asdf install
```

### 動作確認

以下のコマンドが使えるかチェック

```shell
iex
erl
node -v
go version
rustc
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

# homerow

macOS上の画面に映るあらゆるオブジェクトをコマンドで選択できるツール

公式サイトを参考にインストール(https://www.homerow.app/)

ショートカットを`cmd + opt + ctrl + shift + ↓`で設定している

# chromeの拡張で入れているもの

- Vimium (vimライクにchromeの移動が可能)
- ColorPick Eyedropper (画面のドットの色を抽出)
- React Developer Tools(Reactのデバックができる)

## Rancher DeskTopを入れる

※ limaを使っていたがRancher Desktopが便利(.docker_lima.mdに移動)

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
brew install ghq
git config --global ghq.root '~/work/repository/'
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


# jetbrains

キーのリピート入力を受け付けてくれない現象を解決するために、次のコマンドを入力してアプリを再起動

```shell
defaults write -g ApplePressAndHoldEnabled -bool false
```

Reference: https://support.samuraism.com/jetbrains/trouble-shooting/key-repeat-terminal
