set nocompatible

" NeoBundle {{{

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle
  call neobundle#rc(expand('~/.vim/bundle'))
endif

if $SUDO_USER == ''
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'ujihisa/neco-ruby'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-help'
endif

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'banyan/recognize_charcode.vim'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-altr'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rhysd/my-endwise'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'mortice/taglist.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'vim-scripts/Align'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'vim-scripts/Markdown'
NeoBundle 'othree/html5.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'miripiruni/CSScomb-for-Vim'

" }}}

" Settings {{{
" Encording {{{

" デフォルトエンコード"
set encoding=utf-8
" 改行コード
set fileformats=unix,dos,mac

" }}}

filetype plugin indent on
let $PATH = $PATH.':/usr/local/bin/'.':'.$HOME.'/bin'
" タグファイルを探す場所
set tags=./.tags,./../.tags,./*/.tags,./../../.tags,./../../../.tags,./../../../../.tags,./../../../../../.tags
" 起動時のメッセージを表示しない
set shortmess+=I
" ビープをならさない
set vb t_vb=
" vimのヘルプを日本語で表示
set helplang=ja
" 変更中のファイルでも、保存しないで他のファイルを表示することが出来るようにする
set hidden
" ヴィジュアル選択をクリップボードに
set clipboard+=autoselect
" OSのクリップボードを使う
set clipboard+=unnamed
" ウィンドウの横分割で新しいウィンドウをカレントウィンドウの下に開く
set splitbelow
" ウィンドウの縦分割で新しいウィンドウをカレントウィンドウの右に開く
set splitright

" Display {{{

set title
set display=lastline
set nowrap
set scrolloff=10
set sidescrolloff=10
set ruler
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set cursorline
set number
set laststatus=2
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
set showcmd
set showmode
set virtualedit+=block

" 横幅が長いコードをハイライトする
" http://vim-users.jp/2011/05/hack217/
set textwidth=0
if exists('&colorcolumn')
    set colorcolumn=+1
    autocmd FileType sh,zsh,cpp,perl,vim,ruby,slim,haml,css.saass,less,python,haskell,scheme setlocal textwidth=80
endif

if exists('&ambiwidth')
  set ambiwidth=double
endif


" }}}
" Completion {{{

" set wildmenu
set wildchar=<tab>
" set wildmode=list:full
" set wildmode=list:longest
set complete+=k
set completeopt=menuone

" }}}
" Save {{{

set autoread
set autowrite
set confirm
autocmd bufwritepre * :%s/\s\+$//ge

" }}}
" Backup, History {{{

set backup
set backupdir=~/.tmp/vim/backup
set backupskip=/tmp/*,/private/tmp/*"
set swapfile
set directory=~/.tmp/vim/swap
set undofile
set undodir=~/.tmp/vim/undo
set undolevels=1000
set viminfo='50,<1000,s100,:100
set viminfo+=n~/.tmp/vim/viminfo
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
colorscheme monokai_256

" インサートモード時ステータスラインの色を変える
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END


" }}}
" Edit {{{

" どんな設定の時も勝手に改行しないように
set formatoptions=q
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set keywordprg=:help
set iminsert=0
set imsearch=0

" }}}
" Tab, Indent {{{

" タブを使わないスペースにする ( タブを入力するときはc-v<TAB> )
set expandtab

" 可視のタブ幅。4スペース分
set tabstop=4

" cindentやautoindent時や >> で挿入されるタブの幅
set shiftwidth=2

" <TAB>, <BS>の使用などの編集操作をするときのタブが対応する空白の数
set softtabstop=2

" 新しい行を挿入したとき、現在行と同じインデントを適用する
set autoindent

" cの自動インデントを行わない。初期値：オフ
set nocindent

" 新しい行を作ったときに高度な自動インデントを行う。
" cindent がオンのときはオンにしても効果はない。初期値：オフ
set smartindent

" 行頭の余白内で <TAB> を使う際 shiftwidth の数だけインデントする。
" 行頭以外では 'tabstop' の数だけ空白が挿入される。初期値：オフ
set smarttab


" }}}
" Modeline {{{

set modeline

" }}}
" Forlding {{{

set foldenable
" set foldmethod=indent
set foldmethod=marker
set foldcolumn=3
set foldlevel=0

" via http://d.hatena.ne.jp/ns9tks/20080318/1205851539
" 行頭で h を押すと折畳を閉じる。
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" 折畳上で l を押すと折畳を開く。
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる。
vnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" 折畳上で l を押すと選択範囲に含まれる折畳を開く。
vnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" }}}
" Search {{{

set wrapscan
set hlsearch
set incsearch
set ignorecase
set smartcase

" }}}
" Mouse {{{

" set mouse=a
" set guioptions+=a
" set ttymouse=xterm2

" }}}

" }}}

" Misc Commands {{{

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
let mapleader=","

" : ; 入れ替え
nnoremap ; :

nnoremap <CR> :<C-u>call append(expand('.'), '')<CR>ji

" インサートモードを抜ける
inoremap jj <ESC>
inoremap kk <ESC>

" 基本移動
nnoremap j gj
nnoremap k gk

" 移動支援
noremap H ^
noremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" ウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Fold
inoremap zz <C-O>za
nnoremap zz za
onoremap zz <C-C>zw
vnoremap zz zf

" ヘルプ
nnoremap <C-i> :<C-u>vertical help<Space>
nnoremap <C-i><C-i> :<C-u>vertical help<Space><C-r><C-w><CR>

" ヤンク
nnoremap Y y$
nnoremap vy vawy
vnoremap v $h

" 保存・終了
nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>

command! Editrc tabedit $MYVIMRC
command! Editgrc tabedit $MYGVIMRC
command! Reloadrc source $MYVIMRC
command! Reloadgrc source $MYGVIMRC
nnoremap <Space>.. :<C-u>Editrc<Cr>
nnoremap <Space>.r :<C-u>Reloadrc<Cr>

" タブ
nnoremap <Space>tt :<C-u>tabnew<CR>
nnoremap <Space>tf :<C-u>tabfirst<CR>
nnoremap <Space>tl :<C-u>tablast<CR>
nnoremap <Space>tn :<C-u>tabnext<CR>
nnoremap <Space>tN :<C-u>tabNext<CR>
nnoremap <Space>tp :<C-u>tabprevious<CR>
nnoremap <Space>te :<C-u>tabedit<Space>
nnoremap <Space>tc :<C-u>tabclose<CR>
nnoremap <Space>to :<C-u>tabonly<CR>
nnoremap <Space>ts :<C-u>tabs<CR>
nnoremap <Space>td :<C-u>tabdo<Space>
nnoremap <Space>tf :<C-u>tabfind<Space>
nnoremap <Space>tm :<C-u>tabmove<Space>

" インサートモード
" imap <C-e> <End>
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
inoremap <leader><leader> <ESC>:<C-u>call append(expand('.'), '')<CR>ji
nnoremap <leader><leader> :<C-u>call append(expand('.'), '')<CR>j

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
nnoremap <Space>1 :e #1<CR>
nnoremap <Space>2 :e #2<CR>
nnoremap <Space>3 :e #3<CR>
nnoremap <Space>4 :e #4<CR>
nnoremap <Space>5 :e #5<CR>
nnoremap <Space>6 :e #6<CR>
nnoremap <Space>7 :e #7<CR>
nnoremap <Space>8 :e #8<CR>
nnoremap <Space>9 :e #9<CR>
nnoremap <Space>[ :<C-u>bp<CR>
nnoremap <Space>] :<C-u>bn<CR>

"}}}

" Filetype {{{
" HTML {{{
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html,xhtml setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=./;/
autocmd FileType html :compiler tidy
autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
" }}}
" CSS {{{
autocmd BufNewFile,BufRead *.less setlocal filetype=less
autocmd BufNewFile,BufRead *.scss setlocal filetype=scss
autocmd BufNewFile,BufRead *.scss,*.less,*.css setlocal foldmethod=marker
autocmd BufNewFile,BufRead *.scss,*.less,*.css setlocal foldmarker={,}
autocmd BufNewFile,BufRead *.scss,*.less,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
autocmd BufNewFile,BufRead *.scss,*.less,*.css inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>kA<bs><space><space>
autocmd FileType scss,less,css setlocal iskeyword+=-
autocmd FileType scss,less,css setlocal expandtab ts=2 sw=2 sts=2
autocmd FileType css setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
autocmd FileType css :compiler css
" }}}
" JavaScript {{{
autocmd FileType javascript setlocal foldmethod=marker
autocmd FileType javascript setlocal foldmarker={,}
" }}}
" Python {{{
autocmd FileType python set expandtab ts=2 sw=2 sts=2
" }}}
" Ruby {{{
autocmd FileType ruby setlocal expandtab ts=2 sw=2 sts=2
" }}}
" RSpec {{{
autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
" }}}
" Slim {{{
autocmd BufNewFile,BufRead *.slim set filetype=slim
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
autocmd BufNewFile,BufRead *vimperatorrc*,*.vimp set filetype=vimperator
" }}}
" apache {{{
autocmd FileType apache setlocal path+=./;/
" }}}
" git {{{
autocmd FileType gitconfig setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
" }}}
" }}}

" Plugin {{{
" Autodate {{{


let g:autodate_format = ': %FT%T%z'
let g:autodate_keyword_pre = '$Date'
let g:autodate_keyword_post = '\$'

 " }}}
" vimshell {{{

let g:vimshell_temporary_directory = '~/.tmp/vim/vimshell'
let g:vimshell_prompt =  '$ '
let g:vimshell_interactive_update_time = 10
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

autocmd FileType vimshell
  \ call vimshell#altercmd#define('g', 'git')
  \| call vimshell#altercmd#define('l', 'll')
  \| call vimshell#altercmd#define('ll', 'ls -l')
  \| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')

function! g:my_chpwd(args, context)
  call vimshell#execute('ls')
endfunction

nnoremap <Space>; :<C-u>VimShellPop<CR>

 " }}}
" NERD_commenter {{{

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let NERDShutUp = 1

vmap <Space>cc <Plug>NERDCommenterToggle
nmap <Space>cc <Plug>NERDCommenterToggle
nmap <Space>ca <Plug>NERDCommenterAppend
nmap <Space>c$ <Plug>NERDCommenterToEOL
vmap <Space>cs <Plug>NERDCommenterSexy
vmap <Space>cb <Plug>NERDCommenterMinimal

" }}}
" quickrun {{{

" keymap {{{

let g:quickrun_no_default_key_mappings = 1
nmap <Space>r <Plug>(quickrun)

function! s:quickrun_of_buffer()
  if !exists('b:quickrun_of_buffer')
    let b:quickrun_of_buffer = ''
  endif
  echo 'QuickRun' b:quickrun_of_buffer
  execute 'QuickRun' b:quickrun_of_buffer
endfunction
autocmd FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType quickrun inoremap <silent> <buffer> <ESC><ESC> :q<CR>
" }}}
" config {{{

let g:quickrun_config = {}
let g:quickrun_config._ = {'runner': 'vimproc', 'split': 'below10'}
" markdown
let g:quickrun_config['markdown'] = {
  \ 'type': 'markdown/pandoc',
  \ 'cmdopt': '-s',
  \ 'outputter': 'browser'
  \ }

" coffee
let g:quickrun_config['coffee'] = {'command': 'coffee', 'exec': '%c -cpb %s'}

" ruby
let g:quickrun_config['ruby'] = {'command': 'ruby'}

" rspec
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

" }}}

" }}}
" neocomplcache {{{

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_fuzzy_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'actionscript': $HOME . '/.vim/dict/actionscript.dict',
    \ 'java'        : $HOME . '/.vim/dict/java.dict',
    \ 'c'           : $HOME . '/.vim/dict/c.dict',
    \ 'cpp'         : $HOME . '/.vim/dict/cpp.dict',
    \ 'javascript'  : $HOME . '/.vim/dict/javascript.dict',
    \ 'ocaml'       : $HOME . '/.vim/dict/ocaml.dict',
    \ 'objc'        : $HOME . '/.vim/dict/objc.dict',
    \ 'perl'        : $HOME . '/.vim/dict/perl.dict',
    \ 'php'         : $HOME . '/.vim/dict/php.dict',
    \ 'scheme'      : $HOME . '/.vim/dict/scheme.dict',
    \ 'vim'         : $HOME . '/.vim/dict/vim.dict',
    \ 'vimshell'    : $HOME . '/.tmp/vim/vimshell/int_hist',
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" ctags
let g:neocomplcache_ctags_program = '/usr/local/bin/ctags'

" cache dir
let g:neocomplcache_temporary_dir = $HOME.'/.tmp/vim/neocon/'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <CR> で確定してポップアップを閉じる
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" <TAB>: completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplcache#start_manual_complete()
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Enable omni completion.
autocmd FileType css,less,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,erb, markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" }}}
" neocomplcache-snippets {{{

let g:neocomplcache_snippets_dir = $HOME."/.vim/snippets"
command! -nargs=* Nes NeoComplCacheEditSnippets <args>

" imap <expr><C-l> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
"スニペットを編集する
nnoremap <Space>es :<C-u>vertical NeoComplCacheEditSnippets<CR>

" }}}
" vimfiler {{{

let g:vimfiler_data_directory = '~/.tmp/vim/vimfiler'

" }}}
" Unite {{{

let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <C-p> :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-n> :<C-u>Unite -buffer-name=file file<CR>
" レジスタ一覧
nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Space>um :<C-u>Unite file_mru<CR>
nnoremap <C-z> :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <Space>uu :<C-u>Unite buffer file_mru<CR>
" ブックマーク一覧
nnoremap <silent> <Space>uc :<C-u>Unite bookmark<CR>


function! EnableUniteKeymap()
  " ウィンドウを分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
endfunction
autocmd FileType unite call EnableUniteKeymap()

" }}}
" vim-ref {{{

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
" Rsense {{{

let g:rsenseUseOmniFunc = 1

if !empty( $RSENSE_HOME ) && filereadable(expand( $RSENSE_HOME.'/bin/rsense'))
  let g:rsenseHome = $RSENSE_HOME
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

" }}}
" vim-indent-guides {{{

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#454545 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3E3E3E ctermbg=236

" }}}
" vim-textmanip {{{

xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" vmap <C-j> <Plug>(Textmanip.move_selection_down)
" vmap <C-k> <Plug>(Textmanip.move_selection_up)
" vmap <C-h> <Plug>(Textmanip.move_selection_left)
" vmap <C-l> <Plug>(Textmanip.move_selection_right)

" }}}
" vim-smartchr {{{

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

autocmd FileType c,cpp,css,less,php,python,javascript,ruby,rake,coffee,vim call EnableSmartchrBasic()
autocmd FileType python,ruby,rake,coffee,vim call EnableSmartchrRegExp()
autocmd FileType ruby,rake call EnableSmartchrRubyHash()

" }}}
" syntastic {{{

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" }}}
" vim-altr {{{

nmap <F3> <Plug>(altr-forward)
imap <F3> <Plug>(altr-forward)
nmap <F2> <Plug>(altr-back)
imap <F2> <Plug>(altr-back)

" http://d.hatena.ne.jp/joker1007/20111107/1320671775
" ruby tdd
call altr#define('%.rb', 'spec/%_spec.rb')
" gem tdd
call altr#define('lib/%.rb', 'spec/lib/%_spec.rb')
" rails tdd
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')

" }}}
" vim-coffee-script {{{

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufWritePost *.coffee :CoffeeCompile watch vert
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" }}}
" vim-powerline {{{
let g:Powerline_symbols = 'fancy'
" }}}
" vim-ambicmd {{{

if globpath(&rtp, 'autoload/ambicmd.vim') != ''
  cnoremap <expr> <Space> ambicmd#expand("\<Space>")
  cnoremap <expr> <CR>    ambicmd#expand("\<CR>")
endif

" }}}
" open-browser {{{

" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" カーソル下のキーワードをググる
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

" }}}
" zen-cording {{{

" <C-e>で展開
let g:user_zen_expandabbr_key = '<c-e>'

" 展開するHTMLの言語を設定
let g:user_zen_settings = {'lang' : 'ja'}

" }}}

" }}}
