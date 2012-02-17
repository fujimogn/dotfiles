set nocompatible

" NeoBundle {{{
if has('vim_starting')
    set runtimepath+=~/.vim/neobundle
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimshell.git'
" NeoBundle 'ujihisa/vimshell-ssh'
" NeoBundle 'Shougo/unite-ssh'
" NeoBundle 'majutsushi/tagbar'
NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'thinca/vim-ref'
" NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'vim-jp/vimdoc-ja'
" NeoBundle 'mattn/zencoding-vim'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'vim-scripts/Markdown'
NeoBundle 'css_color.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'cakebaker/scss-syntax.vim'

" }}}

filetype plugin indent on
let $PATH = $PATH.':/usr/local/bin/'.':'.$HOME.'/bin'

set shortmess+=I
set vb t_vb=
set helplang=ja,en
set hidden
set clipboard+=autoselect
set clipboard+=unnamed

" Display {{{

set title
set display=lastline
set nowrap
set linespace=0
set sidescroll=1
set scrolloff=10
set sidescrolloff=10
set ruler
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set cursorline
" set cursorcolumn
set number
set laststatus=2
set showtabline=2
set showmatch
set lazyredraw
set ttyfast
set showcmd
set showmode
set wildmenu
set wildmode=list:longest,full
set virtualedit+=block
set textwidth=80

if exists('&colorcolumn')
    set colorcolumn=+1
endif

if exists('&ambiwidth')
  set ambiwidth=double
endif


" }}}
" Save {{{

set autoread
set autowrite
set confirm
autocmd bufwritepre * :%s/\s\+$//ge

" }}}
" Backup, History {{{

set backup
set backupdir=~/.vim/.tmp
set backupskip=/tmp/*,/private/tmp/*"
set swapfile
set directory=~/.vim/.tmp
set undofile
set undodir=~/.vim/.tmp
set undolevels=1000
set viminfo='50,<1000,s100,:100
set viminfo+=n~/.vim/.tmp/viminfo
set history=1000

" }}}
" Color {{{

if $TERM =~ '^xterm'
  set t_Co=256
elseif $TERM =~ '^screen-bce'
  set t_Co=256
elseif $TERM =~ '^rxvt'
  set t_Co=88
elseif $TERM =~ '^linux'
  set t_Co=8
else
  set t_Co=16
endif

syntax on

set background=dark

highlight CursorLine ctermfg=NONE ctermbg=black guibg=black cterm=NONE

" インサートモード時ステータスラインの色を変える
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END


" }}}
" Edit {{{

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set keywordprg=:help

" }}}
" Tab, Indent {{{

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nosmarttab
set formatoptions=qrn1
set autoindent
set smartindent

" }}}
" Modeline {{{

set modeline
set modelines=10

" }}}
" Forlding {{{

set foldenable
set foldmethod=marker
set foldcolumn=2
set foldlevelstart=0

" }}}
" Search {{{
set wrapscan
set hlsearch
set incsearch
set ignorecase
set smartcase

" }}}
" Mouse {{{

set mouse=a
set guioptions+=a
set ttymouse=xterm2

" }}}
" Misc command {{{

command! Editrc edit $MYVIMRC
command! Editgrc edit $MYGVIMRC
command! Reloadrc source $MYVIMRC
command! Reloadgrc source $MYGVIMRC

command! Reloadrc source $MYVIMRC
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

" }}}
" Filetype {{{
" HTML {{{
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" }}}
" CSS {{{
autocmd BufNewFile,BufRead *.css setlocal foldmethod=marker
autocmd BufNewFile,BufRead *.css setlocal foldmarker={,}
autocmd BufNewFile,BufRead *.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
autocmd BufNewFile,BufRead *.css command! Cleansort ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" }}}
" JavaScript {{{
autocmd FileType javascript setlocal foldmethod=marker
autocmd FileType javascript setlocal foldmarker={,}
" }}}
" Python {{{
autocmd FileType python set expandtab
" }}}
" Ruby {{{
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
" }}}
" Makefile {{{
autocmd BufNewFile,BufRead Makefile.rule setlocal filetype=make
autocmd Filetype make set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
" }}}
" Help {{{

au FileType help nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType help inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
au FileType help nnoremap <silent> <buffer> <Space><Space> :q<CR>
au FileType help inoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>

" }}}
" AppleScript {{{

autocmd bufnewfile,bufread *.scpt,*.applescript :setl filetype=applescript
autocmd FileType applescript :inoremap <buffer> <S-CR> ￢<CR>

" }}}
" }}}
" Keymap "{{{

" キーマップリーダー
let mapleader="'"

" Dvorak {{{
" SandS, <Shift>to<ESC>
" no d h
" no h j
" no t k
" no n l
" no j d
" no l n
" no L N
" no s :
" no S :
" no , ,
" " インサートモードを抜ける
" inoremap hh <ESC>
" " 基本移動
" nnoremap d <Left>
" nnoremap h gj
" nnoremap t gk
" nnoremap n <Right>
" " 移動支援
" no D ^
" no N $
" no H 3gj
" no T 3gk
" " ウィンドウ移動
" nnoremap <C-d> <C-w>l
" nnoremap <C-h> <C-w>j
" nnoremap <C-t> <C-w>k
" nnoremap <C-n> <C-w>h
" }}}

" : ; 入れ替え
nnoremap ; :

" インサートモードを抜ける
inoremap jj <ESC>
inoremap kk <ESC>

" 基本移動
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>

" 移動支援
noremap H ^
noremap L $
nnoremap J 3gj
nnoremap K 3gk

" 画面移動
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" ウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Fold
" inoremap z <C-O>za
nnoremap z za
onoremap z <C-C>zw
vnoremap z zf

" ヘルプ
nnoremap <C-i> :<C-u>help<Space>
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><CR>

" ウィンドウ分割
map <F6> :split<C-m>
map <F7> :vsp<C-m>

" ヤンク
nnoremap Y y$
nnoremap vy vawy
vnoremap v $h

" 保存・終了
nnoremap <leader>s :<C-u>w<CR>
nnoremap <leader>wq :<C-u>wq<CR>
nnoremap <leader>q :<C-u>q<CR>

" タブ
nnoremap <Leader>] gt
nnoremap <Leader>[ gT
nnoremap <Leader>tt :<C-u>tabnew<CR>
nnoremap <Leader>tf :<C-u>tabfirst<CR>
nnoremap <Leader>tl :<C-u>tablast<CR>
nnoremap <Leader>tn :<C-u>tabnext<CR>
nnoremap <Leader>tN :<C-u>tabNext<CR>
nnoremap <Leader>tp :<C-u>tabprevious<CR>
nnoremap <Leader>te :<C-u>tabedit
nnoremap <Leader>tc :<C-u>tabclose<CR>
nnoremap <Leader>to :<C-u>tabonly<CR>
nnoremap <Leader>ts :<C-u>tabs<CR>
nnoremap <Leader>td :<C-u>tabdo<Space>
nnoremap <Leader>tf :<C-u>tabfind<Space>
nnoremap <Leader>tm :<C-u>tabmove<Space>

" インサートモード
imap <C-e> <End>
imap <C-a> <Home>
imap <C-h> <Backspace>
imap <C-d> <Del>

" 空行挿入
" inoremap <leader><leader> <ESC>:<C-u>call append(expand('.'), '')<CR>ji
" nnoremap <leader><leader> :<C-u>call append(expand('.'), '')<CR>j

" 日付挿入
inoremap <leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <leader>date <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

" 検索ハイライトをクリア
nnoremap <silent><ESC><ESC> :nohlsearch<CR><ESC>

"}}}
" Plugin/NERD_commenter {{{

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
vmap <leader>cc <Plug>NERDCommenterToggle
nmap <leader>cc <Plug>NERDCommenterToggle

" }}}
" Plugin/quickrun {{{
let g:quickrun_no_default_key_mappings = 1
if !has("g:quickrun_config")
  let g:quickrun_config = {'*': {'split': 'below'}}
endif
nmap <leader>r <Plug>(quickrun)<CR>
" use rvm
" via http://d.hatena.ne.jp/uasi/20110411/1302531017
if strlen($rvm_bin_path)
  let g:quickrun_config['ruby'] = {
\   'command': 'ruby',
\   'exec': '$rvm_bin_path/ruby %s',
\   'tempfile': '{tempname()}.rb'
\ }
endif
autocmd FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType quickrun inoremap <silent> <buffer> <ESC><ESC> :q<CR>

" }}}
" Plugin/neocomplcache {{{
" AutoComplPopを無効
let g:acp_enableAtStartup = 0
" vim起動時に有効化
let g:neocomplcache_enable_at_startup = 1
"smart_caseを有効にする．大文字が入力されるまで大文字小文字の区別をなくす
let g:neocomplcache_enable_smart_case = 1
" CamelCase補完有効化
let g:neocomplcache_enable_camel_case_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" _を区切りとした補完を有効にする
let g:neocomplcache_enable_underbar_completion = 1
" neocomplcacheを自動的にロックするバッファ名のパターンを指定
" ku.vimやfuzzyfinderなど、neocomplcacheと相性が悪いプラグインを使用する場合に設定
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Ctags
let g:neocomplcache_ctags_program = '/usr/local/bin/ctags'
" スニペットの保存場所
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'     : '',
    \ 'actionscript': $HOME . '/.vim/dict/actionscript.dict',
    \ 'java'        : $HOME . '/.vim/dict/java.dict',
    \ 'c'           : $HOME . '/.vim/dict/c.dict',
    \ 'cpp'         : $HOME . '/.vim/dict/cpp.dict',
    \ 'javascript'  : $HOME . '/.vim/dict/javascript.dict',
    \ 'ocaml'       : $HOME . '/.vim/dict/ocaml.dict',
    \ 'objc'        : $HOME . '/.vim/dict/objc.dict',
    \ 'perl'        : $HOME . '/.vim/dict/perl.dict',
    \ 'php'         : $HOME . '/.vim/dict/php.dict',
    \ 'ruby'        : $HOME . '/.vim/dict/ruby.dict',
    \ 'scheme'      : $HOME . '/.vim/dict/scheme.dict',
    \ 'vim'         : $HOME . '/.vim/dict/vim.dict',
    \ 'vimshell'    : $HOME . '/.vimshell_hist',
    \ }
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" Enable omni completion.
autocmd FileType actionscript setlocal omnifunc=actionscriptcomplete#CompleteAS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Keymap
" <C-k>でスニペットの展開をできるように
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" 前回行われた補完をキャンセル
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 補完候補のなかから、共通する部分を補完
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" Dvorak: completion.
" inoremap <expr><C-h> pumvisible() ? "\<C-n>" : "\<C-h>"
" inoremap <expr><C-t> pumvisible() ? "\<C-p>" : "\<C-t>"
" <BS>を押したときに確実にポップアップを削除
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" 現在選択している候補を確定
inoremap <expr><C-y> neocomplcache#close_popup()
" inoremap <expr><C-j> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" inoremap <expr><C-c>  neocomplcache#cancel_popup()
" For cursor moving in insert mode(Not recommended)
" inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" }}}
" Rsense {{{
let g:rsenseUseOmniFunc = 1

if !empty( $RSENSE_HOME ) && filereadable(expand( $RSENSE_HOME.'/bin/rsense'))
  let g:rsenseHome = $RSENSE_HOME
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  autocmd FileType ref-refe nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType ref-refe inoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType ref-refe nnoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
  autocmd FileType ref-refe inoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
endif

" }}}
