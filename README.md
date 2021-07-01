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
echo "source .zsh_profile" >> .zshrc
```

```zsh
echo "source .zsh_profile" >> .zshrc
```

.zsh_profileに以下の内容を貼り付ける

```zsh
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

## ls系
alias ll="ls -la"
alias l="ls -l"

## git系
alias g="git"

# 移動
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
```

## Gitの設定

```zsh
vim .gitconfig
```

```zsh
[user]
	name = makoto
	email = email@example.com
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

## SSHの設定

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

## anyenv
### pyenv/Pythonの設定
### nodebrew/Node.js/yarnの設定
## GCPの設定
## AWSの設定
## PostgreSQLの設定
## asdf/Erlang/Elixir/Phoenixの設定
## ghc/Haskellの設定
## elmの設定
## Dockerインストール
## 
## 
## 
## 
