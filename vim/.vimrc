set nocompatible

" NeoBundle {{{
if has('vim_starting')
    set runtimepath+=~/.vim/neobundle
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'vim-scripts/Markdown'
NeoBundle 'css_color.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/syntastic'

" }}}
" Encording {{{
set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" via http://www.kawaz.jp/pukiwiki/?vim#content_1_7
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = s:fileencodings_default .','. &fileencodings
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" }}}

filetype plugin indent on
let $PATH = $PATH.':/usr/local/bin/'.':'.$HOME.'/bin'
set shortmess+=I
set vb t_vb=
set helplang=ja,en
set hidden
set clipboard+=autoselect
set clipboard+=unnamed
set splitbelow
set splitright


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
set number
set laststatus=2
" set showtabline=2
set showmatch
set lazyredraw
set ttyfast
set showcmd
set showmode
set virtualedit+=block
set textwidth=80

if exists('&colorcolumn')
  set colorcolumn=+1
endif

if exists('&ambiwidth')
  set ambiwidth=double
endif


" }}}
" Completion {{{

set wildmenu
set wildchar=<tab>
" set wildmode=list:full
set complete+=k

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
" set background=dark
colorscheme monokai_256


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
set softtabstop=0
" set nosmarttab
" set formatoptions=qrn1
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
" Keymap "{{{

" キーマップリーダー
let mapleader=" "

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
nnoremap <silent> j gj
nnoremap <silent> gj j
nnoremap <silent> k gk
nnoremap <silent> gk k
nnoremap <silent> $ g$
nnoremap <silent> g$ $
vnoremap <silent> j gj
vnoremap <silent> gj j
vnoremap <silent> k gk
vnoremap <silent> gk k
vnoremap <silent> $ g$
vnoremap <silent> g$ $

" 移動支援
noremap H ^
noremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" Fold
" inoremap z <C-O>za
nnoremap z za
onoremap z <C-C>zw
vnoremap z zf

" ヘルプ
nnoremap <C-i> :<C-u>vertical help<Space>
nnoremap <C-i><C-i> :<C-u>vertical help<Space><C-r><C-w><CR>

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
nnoremap <Leader>te :<C-u>tabedit<Space>
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

" 括弧までを消したり置き換えたりする {{{
" from http://vim-users.jp/2011/04/hack214/
vnoremap ( t(
vnoremap ) t)
vnoremap ] t]
vnoremap [ t[
onoremap ( t(
onoremap ) t)
onoremap ] t]
onoremap [ t[
" }}}

" 空行挿入
" inoremap <leader><leader> <ESC>:<C-u>call append(expand('.'), '')<CR>ji
" nnoremap <leader><leader> :<C-u>call append(expand('.'), '')<CR>j

" 日付挿入
inoremap <leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <leader>date <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

" 検索ハイライトをクリア
nnoremap <silent><ESC><ESC> :nohlsearch<CR><ESC>

" Ex-mode
cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down>  <C-n>

" バッファ
nnoremap <Leader>1 :e #1<CR>
nnoremap <Leader>2 :e #2<CR>
nnoremap <Leader>3 :e #3<CR>
nnoremap <Leader>4 :e #4<CR>
nnoremap <Leader>5 :e #5<CR>
nnoremap <Leader>6 :e #6<CR>
nnoremap <Leader>7 :e #7<CR>
nnoremap <Leader>8 :e #8<CR>
nnoremap <Leader>9 :e #9<CR>
nmap <Leader>b :buffers<CR>

"}}}
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

autocmd FileType help nnoremap q :q<CR>
autocmd FileType help inoremap <ESC><ESC> :q<CR>

" }}}
" AppleScript {{{

autocmd bufnewfile,bufread *.scpt,*.applescript :setl filetype=applescript
autocmd FileType applescript :inoremap <buffer> <S-CR> ￢<CR>

" }}}
" vimperator {{{
autocm BufNewFile,BufRead *vimperatorrc*,*.vimp set filetype=vimperator
" }}}
" }}}
" Plugin/NERD_commenter {{{

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let NERDShutUp = 1
vmap <leader>cc <Plug>NERDCommenterToggle
nmap <leader>cc <Plug>NERDCommenterToggle

nmap <Leader>ca <Plug>NERDCommenterAppend
nmap <leader>c$ <Plug>NERDCommenterToEOL
vmap <Leader>cs <Plug>NERDCommenterSexy
vmap <Leader>cb <Plug>NERDCommenterMinimal

" }}}
" Plugin/quickrun {{{

let g:quickrun_config = {}
let g:quickrun_no_default_key_mappings = 1
if !has("g:quickrun_config")
  let g:quickrun_config = {'*': {'split': 'below'}}
endif
" use rvm
" via http://d.hatena.ne.jp/uasi/20110411/1302531017
if strlen($rvm_bin_path)
  let g:quickrun_config['ruby'] = {
\   'command': 'ruby',
\   'exec': '$rvm_bin_path/ruby %s',
\   'tempfile': '{tempname()}.rb'
\ }
endif

" for rspec
" via http://d.hatena.ne.jp/joker1007/20111208/1323324569
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'exec': 'bundle exec %c %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'exec': '%c %s'
  \}
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

" keymap
nmap <Leader>r <Plug>(quickrun)<CR>
autocmd FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType quickrun inoremap <silent> <buffer> <ESC><ESC> :q<CR>

" }}}
" Plugin/neocomplcache {{{

" AutoComplPopを無効
let g:acp_enableAtStartup = 0

" vim起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" smart_caseを有効にする．大文字が入力されるまで大文字小文字の区別をなくす
let g:neocomplcache_enable_smart_case = 1

" CamelCase補完有効化
let g:neocomplcache_enable_camel_case_completion = 1

" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

" 補完が自動で開始される文字数
let g:neocomplcache_auto_completion_start_length = 3

"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20

" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
" let g:neocomplcache_enable_auto_select = 1

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

"インクルード文のパターンを指定
let g:neocomplcache_include_patterns = {
  \ 'cpp' : '^\s*#\s*include',
  \ 'ruby' : '^\s*require',
  \ 'perl' : '^\s*use',
  \ }

"インクルード先のファイル名の解析パターン
let g:neocomplcache_include_exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }

" ファイルを探す際に、この値を末尾に追加したファイルも探す。
let g:neocomplcache_include_suffixes = {
  \ 'ruby' : '.rb',
  \ 'haskell' : '.hs'
  \ }

" Keymap

" <C-k>でスニペットの展開をできるように
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" <TAB> で補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> neocomplcache#cancel_popup()

" <CR> で確定
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <C-n> でneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"

" <C-p> でkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

" }}}
" Plugin/vim-ref {{{

let g:ref_open = 'vsplit'
let g:ref_phpmanual_path = $HOME.'/Reference/php/php-chunked-xhtml'
let g:ref_no_default_key_mappings = 1

autocmd FileType ruby nnoremap <C-i> :<C-u>Ref refe<Space>
autocmd FileType php nnoremap <C-i> :<C-u>Ref man<Space>

autocmd FileType ruby,php nnoremap <C-i><C-i> :<C-u>call Ref('normal')<CR>
autocmd FileType ruby,php vnoremap <C-i><C-i> :<C-u>call Ref('visual')<CR>

function! Ref(mode)
  if &filetype ==# 'vim'
    execute 'silent! help ' . expand("<cword>")
    if &filetype !=# 'help'
      echo 'No entry'
    endif
  else
    call ref#K(a:mode)
  endif
endfunction

autocmd FileType ref nmap q :<C-u>close<CR>
autocmd FileType ref nmap L <Plug>(ref-forward)
autocmd FileType ref nmap f <Plug>(ref-forward)
autocmd FileType ref nmap H <Plug>(ref-back)
autocmd FileType ref nmap b <Plug>(ref-back)
autocmd FileType ref nmap <CR> <Plug>(ref-keyword)

" }}}
" Plugin/Rsense {{{
let g:rsenseUseOmniFunc = 1

if !empty( $RSENSE_HOME ) && filereadable(expand( $RSENSE_HOME.'/bin/rsense'))
  let g:rsenseHome = $RSENSE_HOME
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  autocmd FileType ref-refe nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType ref-refe inoremap <silent> <buffer> <ESC><ESC> :q<CR>
endif

" }}}
" Plugin/vim-indent-guides {{{

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#454545 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3E3E3E ctermbg=236

" }}}
" Plugin/vim-smartchr {{{
cnoremap <expr> (  smartchr#loop('\(', '(', {'ctype': '/?'})
function! EnableSmartchrBasic()
  inoremap <buffer> ( ()<Esc>i
  inoremap <buffer> [ []<Esc>i
  inoremap <buffer> { {}<Esc>i
  inoremap <buffer><expr> + smartchr#one_of(' + ', '+', '++')
  inoremap <buffer><expr> & smartchr#one_of(' & ', ' && ', '&')
  inoremap <buffer><expr> , smartchr#one_of(', ', ',')
  inoremap <buffer><expr> <Bar> smartchr#one_of('<Bar>', ' <Bar><Bar> ', '<Bar>')
  inoremap <buffer><expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= ' : search('\(\*\<bar>!\)\%#')? '= ' : smartchr#one_of(' = ', ' == ', '=')
endfunction

function! EnableSmartchrRegExp()
  inoremap <buffer><expr> ~ search('\(!\<bar>=\) \%#', 'bcn')? '<bs>~ ' : '~'
endfunction

function! EnableSmartchrRubyHash()
  inoremap <buffer><expr> > smartchr#one_of('>', ' => ')
endfunction

autocmd FileType c,cpp,php,python,javascript,ruby,coffee,vim,css call EnableSmartchrBasic()
autocmd FileType python,ruby,coffee,vim call EnableSmartchrRegExp()
autocmd FileType ruby call EnableSmartchrRubyHash()


" }}}
" Plugin/syntastic {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
" }}}
