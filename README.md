# macOS開発環境構築

上から順に実行すれば依存関係が満たされるように並べている。

セットアップは2通り。どちらでもよい。

- **手動**: このREADMEを上から順に自分で実行する
- **自動**: Claude Codeで`/setup`を実行する。READMEをインプットにClaudeがセットアップを進め、対話コマンド・ブラウザ操作など手動が必要なところだけ依頼される

※`/setup`の実体は`.claude/skills/setup/SKILL.md`だが、そこには進め方の方針しか書いていない。**手順の正はこのREADME**なので、手順を変えるときはREADMEだけ直せばよい。

## Claude Codeで自動セットアップする場合(ブートストラップ)

まっさらなMacでは以下だけ手動で行い、残りは`/setup`に任せる。

1. macOS標準のSafariで「[`iterm2`をインストール](#iterm2をインストール)」
2. iterm2を開いて「[Claude Codeをインストール](#claude-codeをインストール)」
3. このリポジトリを取得して`claude`を起動し、`/setup`を実行

```shell
# ssh設定前なのでhttpsで取得(remoteはセットアップ中にsshへ切り替わる)
# ※初回のgit実行時にCommand Line Toolsのインストールを求められたらダイアログに従う
mkdir -p ~/work/github.com/makoto-developer
git clone https://github.com/makoto-developer/pc-setup.git ~/work/github.com/makoto-developer/pc-setup
cd ~/work/github.com/makoto-developer/pc-setup

# Claude Codeを起動して /setup を実行
claude
```

セットアップの流れ

1. [`iterm2`をインストール](#iterm2をインストール)
2. [Claude Codeをインストール](#claude-codeをインストール)
3. [キーリピート設定変更](#キーリピート設定変更)
4. [macOS Systemの設定](#macos-systemの設定) <- 再ログインが必要な設定はここでまとめて反映しておく
5. [`brew`をインストール](#brewをインストール)
6. [作業ディレクトリを作成しておく](#作業ディレクトリを作成しておく)
7. [必要なツールをインストール](#必要なツールをインストール)
8. [Gitのバージョンを上げる](#gitのバージョンを上げる)
9. [Google Driveを入れる](#google-driveを入れる)
10. [DeepLを入れる](#deeplを入れる)
11. [Google日本語入力の設定](#google日本語入力の設定)
12. [セキュリティソフト](#セキュリティソフト)
13. [sshを設定](#sshを設定)
14. [ghコマンド(GitHub CLI)の認証](#ghコマンドgithub-cliの認証)
15. [GitHub APIトークン(Personal Access Token)の生成](#github-apiトークンpersonal-access-tokenの生成)
16. [dotfilesを取得して、READMEに従って設定する](#dotfilesを取得してreadmeに従って設定する)
17. [署名付きコミットの設定](#署名付きコミットの設定) <- git設定の共通部分はdotfilesにあるため、dotfilesの後にやる
18. [iterm](#iterm)
19. [バージョン管理ツール](#バージョン管理ツール)
20. [Elixir Phoenix インストール](#elixir-phoenix-インストール)
21. [Dockerを入れる](#dockerを入れる)
22. [alt-tab-macosをソースからビルドしてインストール](#alt-tab-macosをソースからビルドしてインストール)
23. [chromeの拡張で入れているもの](#chromeの拡張で入れているもの)

## `iterm2`をインストール

macOS標準のSafariでここ↓からiterm2をダウンロードしてインストール

https://iterm2.com/

※macOS純正のterminalは`brew`がうまく機能しない場合があるので`iterm2`を使う

## Claude Codeをインストール

iterm2を開いて、公式のネイティブインストーラで入れる(brew不要・依存なし)。

```shell
curl -fsSL https://claude.ai/install.sh | bash
```

- `~/.local/bin/claude`にインストールされる
- PATHが通っていなければ`export PATH="$HOME/.local/bin:$PATH"`を追加する(dotfilesの`.zshrc`には設定済み)

動作確認

```shell
claude --version
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

再起動する

## macOS Systemの設定

デフォルトから変更している設定。コマンドで変更できるものは↓でまとめて設定する。
(値は実機の`defaults read`と`macos_defaults.json`から採取したもの)

言語・Caps Lockなど再ログインが必要な設定が含まれるので、セットアップの序盤にやっておくと1回の再ログインで済み、以降の作業も快適になる。

```shell
# 言語を英語に変更(再ログインで反映)
defaults write -g AppleLanguages -array "en-JP" "ja-JP"
defaults write -g AppleLocale -string "en_JP"

# 時計: 秒を表示する
defaults write com.apple.menuextra.clock ShowSeconds -bool true
# 時計: 24時間表示にする
defaults write -g AppleICUForce24HourTime -bool true

# メニューバーにバッテリーの残量(%)を表示する
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# メニューバーにボリュームを表示する(18: 常に表示)
defaults -currentHost write com.apple.controlcenter Sound -int 18

# Siriを無効化する
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
defaults write com.apple.Siri StatusMenuVisible -bool false

# ホットコーナーをすべて無効化する(1: 何もしない)
for corner in tl tr bl br; do
  defaults write com.apple.dock "wvous-${corner}-corner" -int 1
  defaults write com.apple.dock "wvous-${corner}-modifier" -int 0
done

# Caps LockをCtrlに変更する(全キーボード対象、再ログインで反映)
# Src: 30064771129 = Caps Lock / Dst: 30064771300 = Control
defaults -currentHost write -g com.apple.keyboard.modifiermapping.0-0-0 -array \
  '<dict><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer><key>HIDKeyboardModifierMappingDst</key><integer>30064771300</integer></dict>'

# Spotlightのショートカットをctrl + spaceに変更する(64: Spotlight検索, 262144: ctrlキー)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>262144</integer></array></dict></dict>'
# Finder検索ウィンドウ(cmd + option + space)は無効化する
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 \
  '<dict><key>enabled</key><false/></dict>'

# シングルクォーテーション、ダブルクオーテーションの自動変換をオフにする
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# スペルの自動変換をオフにする
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# ファイヤーウォールをONにする
# ※sudoコマンドはパスワード入力が必要なためClaudeのセッションからは実行できない。自分のターミナルで実行すること
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# メニューバー・Dockへ反映
killall Dock SystemUIServer ControlCenter
```

※言語・Caps Lock・Spotlightショートカットの変更は再ログイン(または再起動)で反映される

手動で設定するもの(コマンド化できない・しにくいもの)

- Mission Controlにある使わないアプリはひとつにまとめて削除
- Spotlightの検索対象をアプリケーションとシステム設定以外すべて無効化
- 数字の全角入力をオフにする -> 「[Google日本語入力の設定](#google日本語入力の設定)」で対応する

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
brew install --cask clipy
# alt-tabはbrewではなく自分のforkからビルドする(後述の「alt-tab-macosをソースからビルドしてインストール」参照)
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask jetbrains-toolbox
# アイコン表示対応の等幅フォント(nvimのUI用。iTermのフォントに設定する)
brew install --cask font-hackgen-nerd
# ※orcaのcaskは2026-09-01に無効化予定(Gatekeeper非対応のため)。入らなくなったら公式サイトから入れる
brew install --cask orca
brew install --cask visual-studio-code
brew install --cask notion
brew install --cask discord
brew install --cask openlens
brew install --cask postman
brew install --cask firefox
brew install --cask microsoft-edge
# dockerは後述の「Dockerを入れる」セクション参照
```

```shell
brew install gh
brew install git-lfs
# terraform系はmiseで管理している(dotfilesのmise/config.toml参照)
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
brew install --cask zoom
brew install --cask wireshark
brew install --cask microsoft-excel
brew install --cask microsoft-office
brew install --cask microsoft-openjdk
brew install --cask microsoft-outlook
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask android-file-transfer
```

Caskで入らないアプリ

```text
Google Drive (https://workspace.google.com/products/drive/#download)
One Drive(https://www.microsoft.com/ja-jp/microsoft-365/onedrive/online-cloud-storage)
Kindle (caskが廃止されたのでMac App Storeからインストール)
```

強化版コマンド

```shell
# これがあれば統合エディタは不要
brew install nvim
# nvimのtreesitterパーサのビルドに必要
brew install tree-sitter-cli
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
# cdの強化版(z <名前の一部>で頻出ディレクトリへジャンプ)
brew install zoxide
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

zshのプラグイン(dotfilesの`.zshrc`が読み込む)

```shell
# fish風の入力候補表示 / コマンドの色付け
brew install zsh-autosuggestions zsh-syntax-highlighting
```

## Gitのバージョンを上げる

こちら↓を参考に

https://qiita.com/normalsalt/items/f200ba50363ebfd46df0

```shell
brew install git
```

## Google Driveを入れる

インターネットでGoogle Drive macOSで検索してインストール。同期してバックアップファイルを取得する。

## DeepLを入れる

公式サイト↓からmacOS版をダウンロードしてインストール(caskではなく公式サイトから入れる)

https://www.deepl.com/ja/app

インストール後の設定

- 起動してログインする
- `Cmd + C`を2回連続で押すと選択中のテキストが翻訳されることを確認する
- 動かない場合はシステム設定 -> プライバシーとセキュリティ -> アクセシビリティでDeepLを許可する

## Google日本語入力の設定

公式サイト↓からダウンロードしてインストールし、入力ソースの切り替えと設定を行う。

https://www.google.co.jp/ime/

1. システム設定 -> キーボード -> テキスト入力 -> 入力ソースの「編集」を開く
2. 「+」-> 日本語 -> 「Google日本語入力」の「ひらがな」「英数」を追加する
3. macOS標準の「日本語 - ローマ字入力」を削除してGoogle日本語入力に一本化する
4. メニューバーの入力アイコン -> 「環境設定」で↓を設定する
   - 数字を半角で入力する(全角数字をオフ)
   - スペースの入力を半角にする

※「macOS Systemの設定」の手動項目「数字の全角入力をオフ」はここで対応する

## セキュリティソフト

必要なら入れる

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
  AddKeysToAgent yes
  UseKeychain yes

# 疎通確認
ssh -T git@github.com
```

### パスフレーズの入力を省略

`ssh-add`だけだとssh-agentに載るだけで、再起動(agentの終了)で消えてしまいセッション限りになる。
macOSのKeychainにパスフレーズを保存して恒久的に省略する。

前提: `~/.ssh/config`に↑の`AddKeysToAgent yes`と`UseKeychain yes`が入っていること。

```shell
# パスフレーズをKeychainに保存(初回に1度だけパスフレーズを入力)
# ※`ssh-add -K`は非推奨になったので`--apple-use-keychain`を使う
ssh-add --apple-use-keychain ~/.ssh/id_github_20251006_ed25519

# 登録できたか確認
ssh-add -l
```

再起動後も`UseKeychain yes`によりKeychainからパスフレーズが自動で読まれるため、以降入力は不要。

## ghコマンド(GitHub CLI)の認証

`gh`はbrewでインストール済みの前提(必要なツールのセクション参照)。認証するとPR・issue・APIの操作がCLIからできるようになる。

```shell
gh auth login
# 対話で聞かれる項目は↓のように選ぶ
# ? Where do you use GitHub?                             -> GitHub.com
# ? What is your preferred protocol for Git operations?  -> SSH
# ? Upload your SSH public key to your GitHub account?   -> Skip (ssh設定のセクションで登録済みのため)
# ? How would you like to authenticate GitHub CLI?       -> Login with a web browser
# 表示されるワンタイムコードをコピーしてブラウザで入力して認証する
```

動作確認

```shell
# 認証状態を確認
gh auth status

# 自分のリポジトリが見えればOK(privateも見える)
gh repo list --limit 5
```

拡張: PRダッシュボード(設定はdotfilesの`gh-dash/`参照)

```shell
gh extension install dlvhdr/gh-dash
```

## GitHub APIトークン(Personal Access Token)の生成

APIやCIからGitHubを操作する時に使うトークン。権限とリポジトリを絞れるFine-grained tokenを使う。

1. https://github.com/settings/personal-access-tokens を開く
   (GitHub -> Settings -> Developer settings -> Personal access tokens -> Fine-grained tokens)
2. `Generate new token`をクリック
3. 以下を設定して生成
   - `Token name`: 用途がわかる名前にする(例: `macos-api-20251006`)
   - `Expiration`: 期限を必ず設定する(無期限にしない)
   - `Repository access`: 必要なリポジトリだけに絞る
   - `Permissions`: 必要最小限だけ許可する(例: リポジトリ操作なら`Contents: Read and write`)
4. 生成されたトークン(`github_pat_`で始まる文字列)をコピー
   - この画面を閉じると二度と表示されないので注意

トークンの取り扱い

- 平文のままファイルに置かない、リポジトリにコミットしない
- 漏れた場合は https://github.com/settings/personal-access-tokens から即Revokeする

CLIから使うだけなら、トークンを自分で管理せず`gh`に任せる方が楽で安全。

```shell
# ghコマンドの認証が済んでいれば、トークンが必要な場面では↓で取り出せる
gh auth token
```

API呼び出しの例

```shell
curl -H "Authorization: Bearer <YOUR_TOKEN>" https://api.github.com/user
```

## dotfilesを取得して、READMEに従って設定する

ghq・zshなどの設定はdotfilesにあるので、clone系の作業の前にやっておく。
リポジトリはghq管理下に置き、`~/dotfiles`はシンボリックリンクにする。

```shell
# ghqのクローン先を設定(dotfilesの.gitconfigにも同じ設定があるが、初回はまだ無いので手で設定する)
git config --global ghq.root '~/work'

ghq get -p makoto-developer/dotfiles
ln -s ~/work/github.com/makoto-developer/dotfiles ~/dotfiles

# README.mdをみて設定をする(zsh/git/nvim等のsymlinkを張る)
```

## 署名付きコミットの設定

GitHubのコミットに`Verified`バッジを付ける。GPG鍵を別途作らず、認証で使っているSSH鍵をそのまま署名に使う(git 2.34以降)。

git設定の共通部分(`gpg.format ssh`、`commit.gpgsign`等)はdotfilesの`.gitconfig`で設定済みなので、ここでやるのは鍵の指定と登録だけ。

1. `~/.git_user`(dotfilesのセクションで作成済み)に署名鍵を追記する

```
[user]
signingkey = ~/.ssh/id_github_20251006_ed25519.pub
```

2. GitHubへ署名用の鍵として登録する。認証(Authentication Key)とは別枠なので、同じ鍵でも改めて登録が必要。

ブラウザで登録する場合:

```shell
# 公開鍵をコピー
pbcopy < ~/.ssh/id_github_20251006_ed25519.pub
```

- https://github.com/settings/keys を開く -> `New SSH key` -> `Key type`を`Signing Key`にして登録

ghコマンドで登録する場合:

```shell
# 鍵登録のスコープを追加(ブラウザでワンタイムコードを入力する)
# ※Claudeセッションなど非対話の実行では -h github.com が必須
gh auth refresh -h github.com -s admin:ssh_signing_key

# 署名用として鍵を登録
gh ssh-key add ~/.ssh/id_github_20251006_ed25519.pub --type signing --title "<マシン名> signing"

# 登録できたか確認
gh api /user/ssh_signing_keys -q '.[].title'
```

3. ローカル検証用のallowed_signersを作成する(dotfilesの`.gitconfig`が参照している)

```shell
echo "$(git config user.email) $(cat ~/.ssh/id_github_20251006_ed25519.pub)" > ~/.ssh/allowed_signers
```

動作確認

```shell
git commit --allow-empty -m "test: signed commit"
git log --show-signature -1
# "Good git signature"が出ればOK

git push
# GitHubのコミット履歴でVerifiedバッジが付いていればOK
```

## iterm

フォントをHackGen Nerdに変更する(nvimのアイコン表示に必要)

```text
Settings -> Profiles -> Text -> Font -> 「HackGen Console NF」を選ぶ
```

`cmd + enter`で最大化しないようにする

```text
Keys -> Key Bindings -> +ボタン -> 'CMD + ENTER' is disabled`
```

## バージョン管理ツール

```shell
brew install mise
```

install

```shell
# バージョン定義はdotfilesのmise/config.tomlで管理している
ln -sn ~/dotfiles/mise ~/.config/mise
mise install
```

### 動作確認

以下のコマンドが使えるかチェック

```shell
elixir --version
node -v
go version
rustc -V
terraform version
```

## Elixir Phoenix インストール

公式サイトを参考にインストールする(https://hexdocs.pm/phoenix/installation.html)

```shell
mix archive.install hex phx_new
```

コマンドが使えるか確認

```shell
mix
```

## Dockerを入れる

~~lima やめた~~
~~Rancher Desktopやめた~~
普通のDocker(Docker Desktop)でいい

```shell
# cask名は`docker`から`docker-desktop`に改名された
brew install --cask docker-desktop
```

※このインストールはCLIリンク作成でsudoのパスワード入力を求められる。**Claudeのセッションからは実行できない**ので、自分でiTermの別タブを開いて実行すること。インストール後はDocker.appを一度起動して初回の権限許可を済ませる。

動作確認(docker compose・docker CLIはDocker Desktopに同梱されている)

```shell
docker --version
docker compose version
```

※非商用利用であればDocker Desktopは無料。商用利用はライセンス条件を確認する。

## alt-tab-macosをソースからビルドしてインストール

alt-tabはbrew(cask)ではなく、自分のfork(privateリポジトリ)からビルドして使う。

前提
- Xcodeをフルインストールしておく(Command Line Toolsだけでは不可)
- ssh設定とghqの設定(dotfiles参照)が済んでいること(privateリポジトリのため)

```shell
# クローン
ghq get -p makoto-developer/alt-tab-macos
cd ~/work/github.com/makoto-developer/alt-tab-macos

# ローカル用の自己署名証明書を生成(ビルドのたびに権限確認されるのを回避)
scripts/codesign/setup_local.sh

# ビルド(またはalt-tab-macos.xcodeprojをXcodeで開いてビルド)
xcodebuild -project alt-tab-macos.xcodeproj -scheme Debug

# ビルドされた.appをApplicationsに配置して起動
# (出力先はビルドログ末尾のBUILD SUCCEEDED付近に表示されるDerivedDataのパスを確認)
```

※依存はvendor/配下に同梱されているので、clone後そのままxcodebuildできる

## chromeの拡張で入れているもの

脆弱性が心配なのでほとんど何も入れてない
