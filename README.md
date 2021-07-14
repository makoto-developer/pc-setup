# macOSの環境構築

## アプリのインストール

- Google Chrome
- Slack
- iterm
- Visual Studio Code
- Xcode(Apple Storeからダウンロードしてインストール)
- Rectangle
- Clipy
- Karabiner-Element
- Just Forcus（ポモドーロテクニックアプリ）
- Itsycal(メニューバーカレンダーアプリ)
- Google IEM
- Wally(Ergodoxの設定アプリ)

## Macのシステム環境設定
## Karabinerの設定
## itermの設定

profile -> new Profile


## workディレクトリの作成

```zsh
mkdir 会社名
```

## zshの設定

```zsh
touch .zshrc
touch .zsh_profile
```

```zsh
echo "source ~/.zsh_profile" >> .zshrc
```

.zsh_profileに以下の内容を貼り付ける

```zsh
## 環境変数


## ショートカット
alias _="sudo"
alias mk="mkdir"
alias eli="elixir"
alias el="elixir"
alias ie="iex"
alias er="erl"
alias n="npm"
alias y="yarn"
alias fire="firebase"
alias fr="firebase"
alias nv='nvim'
alias vi='vim'
alias v="vim"
alias nb="nodebrew"
alias nodeb="nodebrew"

## ls系
alias ll="ls -la"
alias l="ls -l"

## git系
alias g="git"

## 移動
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'


## カスタムコマンド


```

## Gitの設定

```zsh
vim ~/.gitconfig
```

メールは現在はこれ: 72484465+makoto-engineer@users.noreply.github.com

```zsh
[user]
	name = makoto
	email = 72484465+makoto-engineer@users.noreply.github.com
[push]
	default = current
[core]
	autocrlf = false
	quotepath = false
	excludesfile = /opt/git/.gitignore_global
[alias]
	a = add
	ad = add
	s = status
	st = status
	ss = stash
	ft = fetch
	df = diff
	dfw = diff --word-diff
	dfn = diff --name-only
	cm = commit
	b = branch
	br = branch
	ps = push
	pl = pull
	co = checkout
	cp = cherry-pick
	cl = clone
	gr = log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
	l = log --oneline
	ld = log --decorate --oneline
	lg = log --decorate --oneline --graph
	unstage = reset HEAD
	clear = clean -df
	# 現在のブランチ名を取得
	bn = !"git rev-parse --abbrev-ref HEAD|tr -d \\\\r\\\\n"
[init]
	defaultBranch = main

```

### グローバルなgitignore

vim ~/.gitignore_global

```zsh
.DS_Store
```

```zsh
$ git config --global core.excludesFile ~/.gitignore_global
```

参考

https://qiita.com/takuya0301/items/29187aa088d04cf92659


## SSHの設定

参考

```zsh
ssh-keygen -t rsa -b 4096 -C "72484465+makoto-engineer@users.noreply.github.com"
```

エンター連打
```
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/iguchi_takashi/.ssh/id_rsa):
Created directory '/Users/iguchi_takashi/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/iguchi_takashi/.ssh/id_rsa.
Your public key has been saved in /Users/iguchi_takashi/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:wbTmcTSRnDBvhSGX8lk3cGzPc/KPLyAHBvlbms9yvSw 72484465+makoto-engineer@users.noreply.github.com
The key's randomart image is:
+---[RSA 4096]----+
|        =+*Boo.  |
|       o+B*o..=  |
|        *=+o o + |
|       o =* . ..+|
|        S. *   oo|
|          = o   .|
|           = o ..|
|          . E.+ .|
|           o .o+.|
+----[SHA256]-----+
```

githubに公開鍵を登録する

```zsh
cat ~/.ssh/id_rsa.pub
出力を貼り付ける
```

## vim/Neovimの設定

まずはvimの基本設定から
```zsh
vim ~/.vimrc
```

以下の内容を貼り付ける

```
"****************************************************************
" 文字コード
"****************************************************************
set encoding=UTF-8
scriptencoding utf-8
set fileencoding=utf-8

"****************************************************************
" 検索
"****************************************************************
" 大文字小文字を区別しない
set ignorecase
" 小文字で検索するとき、大文字と小文字を無視
set smartcase
" ファイル末尾まで進んだら、先頭へジャンプ
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
hi Search ctermbg=lightyellow
hi Search ctermfg=Black
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

"****************************************************************
" バックアップ
"****************************************************************
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
set nobackup
" スワップファイルを作成しない
set noswapfile

"****************************************************************
" 移動
"****************************************************************
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

"****************************************************************
" 表示設定
"****************************************************************
" 行表示
set nu
" エラーのときビープを鳴らさない
set noerrorbells
" 対応する括弧を強調表示
set showmatch
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を5000件保存する
set history=5000
" コメントの色を水色
hi Comment ctermfg=3
" yでコピーした時にクリップボードに入る
set guioptions+=a
" タイトルを表示
set title
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2

"****************************************************************
" Ctrl + hjilでウィンドウ移動ができる
"****************************************************************
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"****************************************************************
" マクロ的な何か...
"****************************************************************
" 自動でvimrcの設定が反映される
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
```

## brew

こちらを見ながらやる

https://brew.sh/index_ja

## nodebrew/Node.js/yarnの設定

こちらを見ながらやる

https://github.com/hokaccha/nodebrew

```

```zsh
vim .zsh_profile

# 追加
export PATH=$HOME/.nodebrew/current/bin:$PATH
```

## VScode


.vscode/settings.json

```json
{
    "workbench.colorCustomizations": {
        "titleBar.activeBackground": "#4aa1c4",
        "titleBar.activeForeground": "#000000",
        "activityBar.background": "#4aa1c4",
        "activityBar.foreground": "#000000"
    }
}
```

### VSCode 拡張機能

ElixirLS: Elixir support and debugger
Bracket Pair Colorizer
Rainbow CSV
indent-rainbow
Path Intellisense
HTML CSS Support
IntelliSense for CSS class names in HTML
npm
yarn
Draw.io Integration
vim
YAML
Go

## Elixir/Phoenix

asdfでElixir環境を構築

こちらを参照

https://asdf-vm.com/#/core-manage-asdf

macOS -> Homebrew 経由でインストール

```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
```

macOS -> ZSH -> Git

```
. $HOME/.asdf/asdf.sh
```

プラグインを
プラグインを入れる

```zsh
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

### Erlangインストール

最新のErlangを確認

```zsh
asdf list-all erlang
```

最新のErlangを入れる

```zsh
asdf install erlang 24.0.3
```

インストール済みのErlangのバージョンを確認

```zsh
asdf list erlang
```

Erlangを使えるようにする

```zsh
asdf global erlang 24.0.3
```

### Elixirをインストール

Erlangと同じく、インストール可能なElixirバージョンを確認

```
asdf list-all elixir
```
最新のElixirを入れる

```zsh
asdf install elixir 1.12.2-otp-24
```

インストール済みのElixirのバージョンを確認

```zsh
asdf list elixir
```

Elixirを使えるようにする

```zsh
asdf global elixir 1.12.2-otp-24
```

### Phoenix

```zsh
mix archive.install hex phx_new
```
## NeoVIM

neovimの公式ページからダウンロードして実行する

https://github.com/neovim/neovim

いったん、すべてのアプリを権限を無視して実行できるようにする

```zsh
sudo spctl --master-disable
```

```zsh
sudo ./nvim-osx64/bin/nvim
```

## キーリピート設定変更

```
defaults write -g InitialKeyRepeat -int 13
defaults write -g KeyRepeat -int 1
```

緊急時もとに戻す
```
defaults delete -g InitialKeyRepeat
defaults delete -g KeyRepeat
```

## AWSの設定
## GCPの設定
## PostgreSQLの設定
## ghc/Haskellの設定
## elmの設定
## Dockerインストール
## 
## 
## 
## 
