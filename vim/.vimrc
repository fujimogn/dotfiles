"-----------------------------------------------------------------
"
" rc for vim 7.3
"
" $Date: 2011-09-13T01:40:57+0900$
"
"-----------------------------------------------------------------

"-----------------------------------------------------------------
" for Win32
"-----------------------------------------------------------------
" {{{

if has('win32')
  set runtimepath+=$HOME/.vim,$HOME/.vim/after
endif

" }}}
"-----------------------------------------------------------------
" Vundle
"-----------------------------------------------------------------
" {{{

set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"" let Vundle manage Vundle
"Bundle 'gmarik/vundle'
"" 使用中のプラグイン
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shogo/unite.vim'
"Bundle 'thinca/vim-ref'
"Bundle 'thinca/vim-quickrun'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-surround'
"Bundle 'ZenCoding.vim'
filetype plugin indent on

" }}}
"-----------------------------------------------------------------
" Basic
"-----------------------------------------------------------------
" {{{

syntax enable
scriptencoding utf-8
set keywordprg=:help
set ambiwidth=double
set autoindent                  " 自動でインデント
set autoread                    " 他で書き換えられたら自動で読み直す
set backspace=indent,eol,start
set backup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
" set clipboard+=unnamed          " ヤンクしたときに自動でクリップボードにコピー
" set cmdheight=1                 " コマンドラインの高さ
" set cindent                     " Cの自動インデントを始める
set cursorline                  " カーソル行をハイライト
set cole=2
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
set gdefault
set helplang=ja,en
set hlsearch                    " 検索文字をハイライト
set hidden                      " 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set history=1000
set ignorecase                  " 検索時大文字小文字無視
set incsearch                   " インクリメンタルサーチ
set infercase
set linebreak
set iminsert=0
set imsearch=0
set laststatus=2                " ステータスラインを常時表示させる
set lazyredraw                  " スクリプト実行中に再描画しない
set list                        " 不可視文字表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%  " 不可視文字の表示形式
set mouse=a
set mousehide
set mousemodel=popup
set modeline
set modelines=5
set number                      " 行番号表示
set numberwidth=3
" set nobackup                    " バックアップ取らない
set noerrorbells
set noimcmdline
set noimdisable
set noswapfile                  " スワップファイル作らない
" set nowritebackup               " set writebackupを指定してもオプション 'backup' がオンでない限り、バックアップは上書きに成功した後に削除される。
set nowrap                      " 折り返さない
set nrformats-=octal            " 8進数を無効にする。<C-a>,<C-x>に影響する
set report=0
set ruler
set printoptions=paper:letter
set sbr=↪\
set scrolloff=5                 " スクロール時の余白確保
set sidescrolloff=5
set shiftwidth=2                " 自動で挿入されるインデント幅
set shiftround
set shortmess=aTItoO
set shortmess+=I                " 起動時のメッセージを消す
set showfulltag
set showmatch                   " 括弧の対応をハイライト
set showmode                    " 現在のモードを表示
set showcmd
set showtabline=2               "
set smartindent                 " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set smarttab                    "
set smartcase                   " 検索文字列に大文字が含まれている場合は区別して検索する
set softtabstop=2               " Tab 押下時に挿入されるスペース数
set suffixes+=.pyc,.pyo,.zwc
set splitright
set splitbelow
set switchbuf=usetab
" set tabstop=2                   " ファイル中のタブ文字の表示幅
set tags=./tags,tags,~/tags
" set textwidth=0                 " 一行に長い文章を書いていても自動折り返しをしない
set timeoutlen=2000             " キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set title
set titlestring=%f%(\ [%M]%)
set ttyfast
set undolevels=1000
set undofile undodir=~/.tmp,/var/tmp,/tmp
" set vb t_vb=                    " ビープをならさない
set viminfo='1000,<1000,s100,h    " viminfo設定
set virtualedit=block           " Visual blockモードでフリーカーソルを有効にする
set visualbell
set wildmenu                    " コマンド補完を強化
set wildchar=<tab>              " コマンド補完を開始するキー
set wildmode=longest:full,list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.so
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.pdf
set wildignore+=*.pyc,*.pyo
" set wildignorecase
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする
set wrapscan                    " 最後まで検索したら先頭へ戻る

" }}}
"-----------------------------------------------------------------
" keymap
"-----------------------------------------------------------------
" {{{

" キーマップリーダ
let mapleader = ","
" let g:mapleader = ","
"
"カーソルを表示行で移動する。論理行移動は<C-n>, <C-p>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 0, 9 で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $
" ; でコマンド入力
noremap ; :
noremap : ;
" Ctrl-n, Ctrl-pでタブ移動
nnoremap <C-n> gt
nnoremap <C-p> gT
" Ctrl-hjkl でsplitウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>

" w!! でsudoが必要な場合でも保存
cmap w!! w !sudo tee % >/dev/null

" zz で折り畳みをトグルさせる
nnoremap zz za
" zz でヴィジュアル選択を折り畳み
vnoremap zz zf

" , の後に自動的にスペースを挿入
" inoremap , ,<space>

" esc 2回で検索ハイライトをクリア
nmap <esc><esc> ;nohlsearch<cr><esc>

" 日時挿入
inoremap <leader>date <C-R>=strftime('%A,  %B %d,  %Y')<CR>
inoremap <leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <leader>rdate <C-R>=strftime('%A,  %B %d,  %Y %H:%M')<CR>
inoremap <leader>w3cdtf <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

nmap <silent> ,r :set relativenumber! relativenumber?<cr>
nmap <silent> ,c :set cursorcolumn!   cursorcolumn?<cr>
nmap <silent> ,l :set cursorline!     cursorline?<cr>
nmap <silent> ,n :set number!         number?<cr>
nmap <silent> ,p :set paste!          paste?<cr>
nmap <silent> ,w :set wrap!           wrap?<cr>



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

" }}}
"-----------------------------------------------------------------
" color
"-----------------------------------------------------------------
" {{{

set t_co=256
set background=dark
"colorscheme desert256

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
set statusline +=[%{GetB()}]                                " <filepath><modified flag> [<character>]
set statusline +=\ %l/%L%4P                                 " <current>/<total> <position>


" "入力モード時、ステータスラインのカラーを変更
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
" augroup END

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
