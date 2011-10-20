"-----------------------------------------------------------------
"
" rc for vim 7.3
"
" $Date: 2011-10-19T09:47:18+0900$
"
"-----------------------------------------------------------------

set nocompatible
set runtimepath+=$HOME/.vim/runtime

"-----------------------------------------------------------------
" Vundle
"-----------------------------------------------------------------
" {{{

filetype off

set runtimepath+=$HOME/.vim/bundles/vundle/
call vundle#rc( $HOME.'/.vim/bundles' )
let $vundlerc=$HOME.'/.vim/.vundle'
com! EditBundles :e $vundlerc
augroup Vundle
  au!
  au BufWritePost $vundlerc call vundle#config#init()
  au BufWritePost $vundlerc source $vundlerc
  au BufWritePost $vundlerc BundleClean
  au BufWritePost $vundlerc BundleInstall
augroup END
source $vundlerc

filetype plugin indent on

" }}}
"-----------------------------------------------------------------
" Basic
"-----------------------------------------------------------------
" {{{

syntax on
scriptencoding utf-8
set keywordprg=:help
set autoindent                  " 自動でインデント
set autoread                    " 他で書き換えられたら自動で読み直す
set backspace=indent,eol,start  " バックスペースで何でも消す
set backup                      " ファイルを上書きする前にバックアップファイルを作る
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set clipboard+=unnamed          " ヤンクしたときに自動でクリップボードにコピー
set cmdheight=1                 " コマンドラインの高さ
" set cindent                     " Cの自動インデントを始める
set cursorline                  " カーソル行をハイライト
set completeopt=longest,menu,menuone
" set copyindent
set display=lastline
" set display=uhex                " 印字不可能文字を16進数で表示
" set diffopt=filler,vertical     " Diff設定 埋め立て行を表示、常に垂直分割
set encoding=utf-8
set expandtab                   " Tab を空白に変換
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac
set fileformat=unix
" set foldmethod=indent
set foldmethod=marker
" set foldlevel=99
set formatoptions-=t
set formatoptions+=corqn
" set formatoptions-=ro           " 改行時のコメントアウト自動継続を無効化
" set formatoptions+=mM           " 日本語の行の連結時には空白を入力しない
" set formatoptions+=lmq          " テキスト整形オプション，マルチバイト系を追加
set gdefault                    " :sコマンドで'g'オプションをデフォルトにする
set helplang=ja,en
set hlsearch                    " 検索文字をハイライト
set hidden                      " 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set history=1000
set ignorecase                  " 検索時大文字小文字無視
set incsearch                   " インクリメンタルサーチ
set infercase                   " 挿入モードの単語の補完で、大文字、小文字の無視
set linebreak                   " 入力した行が長い場合に自動的に改行をする
set iminsert=0                  " 入力モードで自動的に日本語入力を使わない
set imsearch=0                  " 検索で自動的に日本語入力を使わない
set laststatus=2                " ステータスラインを常時表示させる
set lazyredraw                  " スクリプト実行中に再描画しない
set list                        " 不可視文字表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%  " 不可視文字の表示形式
" set mouse=a
" set mousehide
" set mousemodel=popup
set modeline                    " モードラインを有効にする
set modelines=10                " モードラインを上下端から探す行数 / 5
set number                      " 行番号表示
set numberwidth=5               " 行番号表示幅
" set nobackup                    " バックアップ取らない
set noerrorbells                " エラーメッセージに伴ってベルを発生させない
set noimcmdline                 " コマンドラインでIMEをオフ
set noimdisable                 " IMEを使わない
set noswapfile                  " スワップファイル作らない
" set nowritebackup               " set writebackupを指定してもオプション 'backup' がオンでない限り、バックアップは上書きに成功した後に削除される。
set nowrap                      " 折り返さない
set nrformats-=octal            " 8進数を無効にする。<C-a>,<C-x>に影響する
set report=0                    " : コマンドにより変更された行の数の報告が出る最小値
set ruler                       " カーソルが何行目の何列目に置かれているかを表示する
set scrolloff=5                 " スクロール時の余白
set sidescrolloff=5             " 横スクロール時の余白
set shiftwidth=2                " 自動で挿入されるインデント幅
set shiftround                  " インデントをオプション 'shiftwidth' の値の倍数に丸める
set shortmess+=I                " 起動時のメッセージを消す
" set showfulltag
set showmatch                   " 括弧の対応をハイライト
set showmode                    " 現在のモードを表示
set showcmd                     " コマンドをステータスラインに表示する
set showtabline=2               "
set smartindent                 " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set smarttab                    "
set smartcase                   " 検索文字列に大文字が含まれている場合は区別して検索する
set softtabstop=2               " Tab 押下時に挿入されるスペース数
" set suffixes+=.pyc,.pyo,.zwc
set splitright                  " 新規ウィンドウを右に開く
set splitbelow                  " 新規ウインドウを下部に開く
set switchbuf=usetab            " バッファ選択でタブを使用
" set tabstop=2                   " ファイル中のタブ文字の表示幅
set tags=./tags,tags,~/tags
" set textwidth=0                 " 一行に長い文章を書いていても自動折り返しをしない
" set timeoutlen=2000             " キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set title                       " ウィンドウのタイトルを変更する
set titlestring=%f%(\ [%M]%)    " ウィンドウタイトルに使われる文字
set ttyfast                     " 高速ターミナル接続を行う
set undolevels=1000
set undofile undodir=~/.tmp,/var/tmp,/tmp
set viminfo='1000,<1000,s100,h    " viminfo設定
set virtualedit=block           " Visual blockモードでフリーカーソルを有効にする
set visualbell                  " エラー音の代わりに画面フラッシュを使う
set wildmenu                    " コマンド補完を強化
set wildchar=<tab>              " コマンド補完を開始するキー
set wildmode=longest:full,list:full
" set wildignore=*.swp,*.bak,*.pyc,*.class
" set wildignore+=.svn,CVS,.git
" set wildignore+=*.o,*.a,*.so
" set wildignore+=*.jpg,*.png,*.gif
" set wildignore+=*.pdf
" set wildignore+=*.pyc,*.pyo
" set wildignorecase
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする
set wrapscan                    " 最後まで検索したら先頭へ戻る

if exists('&ambiwidth')
  set ambiwidth=double
endif

" }}}
"-----------------------------------------------------------------
" keymap
"-----------------------------------------------------------------
" {{{

" leader
let mapleader = ","
"カーソルを表示行で移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 0, 9 で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $
" ; でコマンド入力
nnoremap ; :
" Ctrl-n, Ctrl-pでタブ移動
nnoremap <C-n> gt
nnoremap <C-p> gT
" 画面移動
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-h> 5h
nnoremap <C-l> 5l
" nnoremap <C-u> <C-u>zz
" nnoremap <C-d> <C-d>zz
" 保存
nnoremap <Space>w :<C-u>write<CR>
" 終了
nnoremap <Space>q :<C-u>quit<CR>
" zz で折り畳みをトグルさせる
nnoremap zz za
" zz でヴィジュアル選択を折り畳み
vnoremap zz zf
" , の後に自動的にスペースを挿入
" inoremap , ,<space>
" esc 2回で検索ハイライトをクリア
nmap <esc><esc> ;nohlsearch<cr><esc>
" 挿入モード時の削除
inoremap <C-d> <Del>
inoremap <C-h> <BackSpace>
" 日時挿入
inoremap <leader>date <C-R>=strftime('%A,  %B %d,  %Y')<CR>
inoremap <leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <leader>rdate <C-R>=strftime('%A,  %B %d,  %Y %H:%M')<CR>
inoremap <leader>w3cdtf <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>


" }}}
"-----------------------------------------------------------------
" autocmd
"-----------------------------------------------------------------
" {{{

" 保存時に行末の空白を除去する
autocmd bufwritepre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd bufwritepre * :%s/\t/  /ge
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
" file type
autocmd filetype python set expandtab
autocmd filetype ruby set shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim

" }}}
"-----------------------------------------------------------------
" color
"-----------------------------------------------------------------
" {{{

set t_co=256
" set background=dark
" colorscheme desert256

" Highlight
" highlight CursorLine term=reverse cterm=reverse
highlight CursorLine ctermfg=NONE ctermbg=black guibg=black cterm=NONE
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=black guibg=black
" highlight ExtraWhitespace ctermbg=black guibg=black
" match ExtraWhitespace /\s\+$/

"}}}
"-----------------------------------------------------------------
" statusline
"-----------------------------------------------------------------
" {{{

" Statusline
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

set laststatus=2
set statusline=
set statusline +=%<[%n]                                     " [<buffer number>]
set statusline +=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " [<fe>:<ff>]
set statusline +=%y\                                        " [<ft>]
" set statusline +=%5*%{fugitive#statusline()}%*            " <git status>
" set statusline +=%2*%#warningmsg#%*                       " <syntastic warning msg>
" set statusline +=%2*%{SyntasticStatuslineFlag()}%*        " <syntastic status>
set statusline +=%f%m%r%w
set statusline +=%=                                         " Left / Right separator
set statusline +=[%{GetB()}]                                " [<character>]
set statusline +=\ %l/%L%4P                                 " <current>/<total> <position>

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction

func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" }}}
"-----------------------------------------------------------------
" Plugin
"-----------------------------------------------------------------
" {{{

" Autodate
let g:autodate_format = ': %FT%T%z'
let g:autodate_keyword_pre = '$Date'
let g:autodate_keyword_post = '\$'

" TagBar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1

" }}}
