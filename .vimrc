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

