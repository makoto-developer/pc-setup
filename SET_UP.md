# 開発環境構築

## 必須ツール
Googleで検索

```
chrome
カスペルスキー(会社で指定されていなかったら入れておく)
google ime
```

## Apple Storeからインストール

```
Line App
XCode
```

## iterm2をインストール
```
https://iterm2.com/downloads.html
```
[iterm2](https://iterm2.com/)

## [brew](https://brew.sh/index_ja)をインストール

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 後で.zsh_profileにパスを追加 
#eval "$(/opt/homebrew/bin/brew shellenv)" # この作業は最近必要なくなったらしい
```

## ツールをインストール(必要ないやつ入れない)

**ツールインストールの大原則**
- プログラミング言語 -> asdf
- cliやツール類 -> brew

迷ったら自動でバージョンアップしても問題ないものはbrew。それ以外はasdfを使う(ケースによってバージョンの切り替えが必要の場合のみ)。


必要なツールをインストール(不要なものは削除してOK)
```
brew install --cask clipy
brew install --cask alt-tab
brew install --cask rectangle
brew install --cask notion
brew install --cask kindle
brew install --cask discord
brew install --cask karabiner-elements
brew install --cask figma
brew install --cask slack
brew install twty

# 一括
brew install --cask clipy alt-tab rectangle notion kindle discord karabiner-elements figma slack twty
```

[clipy](https://formulae.brew.sh/cask/clipy)
[alttab](https://alt-tab-macos.netlify.app/)
[rectangle](https://github.com/rxhanson/Rectangle)

## 開発用のフォントをインストール

[こちら](https://github.com/yuru7/HackGen)

```
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd
```


## power font(preztoのテーマの設定で必要になる)

[公式に書いてある通り](https://github.com/powerline/fonts)インストール

```
git clone https://github.com/powerline/fonts.git --depth=1

cd fonts
./install.sh

cd ..
rm -rf fonts
```


## Gitのバージョンを上げる

[こちらを参考に](https://qiita.com/normalsalt/items/f200ba50363ebfd46df0)

```
brew install git
```

## sshを設定

```
$ mkdir .ssh
$ cd $_
$ ssh-keygen -t ed25519 -C "your email"

Generating public/private ed25519 key pair.
Enter file in which to save the key (/Users/user/.ssh/id_ed25519): id_github <<<githubを例に。ドメインごとにsshkeyを作成する。流用しない。>>>
Enter passphrase (empty for no passphrase): <<<パスフレーズを設定(Githubでは設定することを推奨している)>>>
Enter same passphrase again: <<<パスフレーズを設定(Githubでは設定することを推奨している)>>>
Your identification has been saved in id_github
Your public key has been saved in id_github.pub
The key fingerprint is:
The key's randomart image is:
+--[ED25519 256]--+
|  oooooo         |
|  oooooo         |
|  oooooo         |
|                 |
|                 |
|                 |
|             ..  |
+----[SHA256]-----+

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
ssh-add id_github

# 登録できたか確認
ssh-add -l
```

## dotfilesを取得して、READMEに従って設定する

```
git clone git@github.com:makoto-developer/dotfiles.git
```


## workディレクトリの作成

```zsh
#mkdir 会社名
mkdir work
```

# 設定編

## iterm

itermのprofileから↓のパスの設定ファイルをimportする

```
~/dotfiles/iterm/
```

## `cmd + enter`で最大化しないようにする

```
Keys -> Key Bindings -> +ボタン -> 'CMD + ENTER' is disabled`
```

## キーボード設定
<img width="630" alt="image" src="https://user-images.githubusercontent.com/72484465/182054276-ca00b1e0-840e-4bc8-9205-e2e09a0aab18.png">


## キーリピート設定変更

```
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

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

インストールが終わったら↓のコマンドを実行

```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

preztoのシンボリックをバックアップ(削除でもOK)

```
mv .zshrc .zshrc_zprezto_original
```

dotfilesのシンボリックを貼り直す

```
ln -s dotfiles/zsh/zshrc ~/.zshrc
ln -s dotfiles/zsh/.zsh_profile ~/.zsh_profile
```

[ここを参照](https://github.com/sorin-ionescu/prezto/tree/master/modules)して必要なテーマを入れる

```
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

```
vi ~/.zprofile

#
# Editors
#

export EDITOR='nano' # <-- viにする
export VISUAL='nano' # <-- viにする
export PAGER='less'
```

preztoのテーマを変更する


```
vi .zpreztorc

#  128行目辺り
#zstyle ':prezto:module:prompt' theme 'sorin'
zstyle ':prezto:module:prompt' theme 'agnoster'
```

```
mv ~/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme ~/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme-original
ln -s ~/dotfiles/zsh/agnoster.zsh-theme  ~/.zprezto/modules/prompt/external/agnoster/
```


## バージョン管理ツールインストール

[こちらを参照](https://asdf-vm.com/#/core-manage-asdf)

macOS -> Homebrew 経由でインストール

```
sudo xcodebuild -license accept
brew install asdf
```

asdfのパスを通す

```
. $(brew --prefix asdf)/asdf.sh
. $(brew --prefix asdf)/libexec/asdf.sh
```

プラグインを入れる(使いそうにないやつは削除)

```zsh
asdf plugin-add haskell
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add nodejs
asdf plugin add neovim
asdf plugin-add golang
asdf plugin-add golangci-lint
asdf plugin-add kubectl
asdf plugin-add yarn
asdf plugin-add rust
asdf plugin-add zig
asdf plugin-add clojure

```

### Elixirをインストール

Elixirのバージョンを確認

```
asdf list-all elixir
```

最新のElixirを入れる

```zsh
asdf install elixir 1.13.2-otp-24
```

インストールしたのElixirのバージョンを確認

```zsh
asdf list elixir
```

Elixirを使えるようにする

```zsh
asdf global elixir 1.13.2-otp-24
```

プロジェクトごとに固定にする場合はlocalを使う

```zsh
asdf local elixir 1.13.2-otp-24
```

### Erlangインストール

elixirと同じく、インストール可能なElixirバージョンを確認

```zsh
asdf list-all erlang
```

最新のErlangを入れる

```zsh
asdf install erlang 24.2.1
```

インストール済みのErlangのバージョンを確認

```zsh
asdf list erlang
```

Erlangを使えるようにする

```zsh
asdf global erlang 24.2.1
```

プロジェクトごとに固定にする場合はlocalを使う

```zsh
asdf local erlang 24.2.1
```

### 動作確認

以下のコマンドが使えるかチェック

```zsh
iex
erl
mix
```

### Phoenixインストール

```zsh
mix archive.install hex phx_new
```

## vimの設定

jetbrains製品でも同じvimの設定を共有する

```
ln -s ~/dotfiles/vim/.vimrc ~/.ideavimrc
```

## Node.jsインストール

###  インストール可能なバージョンを確認

```zsh
asdf list-all nodejs
```

### nodejsをインストール

```zsh
asdf install nodejs 16.13.2
```

### バージョンを固定化

グローバルで固定にするとき

```zsh
asdf global nodejs 16.13.2
```

プロジェクトごとに固定化するとき

```zsh
asdf local nodejs 16.13.2
```

## その他ツール

必要に応じて入れる

- Wally(Ergodoxのconfiguration)
- office excel powerpoint
- docker
- notion

# chromeの拡張で入れているもの
- Octotree GitHub code tree (githubにtree形式でフォルダ構造がみえるようにする)
- vimium (vimライクにchromeの移動が可能
- ColorPick Eyedropper (画面のドットの色を抽出)
- Fonts Ninja (画面で見えているフォントを調べる)

## dockerが有料化した問題への暫定対処方法

```
書いていく
```


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

## 初回尋ねられるので Proceed with the default configuration を選択
## ? Creating an instance "default"  [Use arrows to move, type to filter]
## > Proceed with the default configuration
## Open an editor to override the configuration

# zshrcにDockerHostを追加
echo 'export DOCKER_HOST=unix://$HOME/.lima/docker/sock/docker.sock' >> ~/.zshrc
source  ~/.zshrc

# dockerの疎通ができることを確認
docker ps --all

# お試しでNginxが起動できるかどうかを確認
docker pull nginx
docker run --name start-nginx -d -p 8080:80 nginx
docker ps -a

```
[localhost:8080](http://localhost:8080)を開いてNginxが動いていることを確認

確認が終わったら終了する

```shell
docker stop start-nginx
```

## twtyの使い方(twitterのcli版)

カフェとかで画面見られたときに恥ずかしい(セキュリティ的にもアウトか)のでcliで投稿できるようにしたいので導入

[how_to_use_twty.md](./how_to_use_twty.md)