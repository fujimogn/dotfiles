set nocompatible

" vundle {{{
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
" }}}

filetype plugin indent on
syntax on

let $PATH = $PATH.':/usr/local/bin/'.':'.$HOME.'/bin'
set shortmess+=I
set vb t_vb=
set helplang=ja,en
set hidden
set clipboard+=unnamed
set tags=./tags,tags,~/tags
set splitbelow
set splitright
set notimeout
set nottimeout

" Encording {{{
set fileformats=unix,dos,mac
" }}}
" Save {{{
set autoread
set autowrite
set confirm
autocmd bufwritepre * :%s/\s\+$//ge

" }}}z
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

set background=dark
highlight CursorLine ctermfg=NONE ctermbg=black guibg=black cterm=NONE

" }}}
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
set textwidth=90
if exists('&colorcolumn')
    set colorcolumn=+1
endif

if exists('&ambiwidth')
  set ambiwidth=double
endif

"
" }}}
" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.psd,*ai,*.fla,*.xfl
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.pyc
set wildignore+=*.swc,*.swf
set wildignore+=*.DS_Store,*.Thumbs.db
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
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" function! MyFoldText()
  " let line = getline(v:foldstart)
  " if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    " let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    " let linenum = v:foldstart + 1
    " while linenum < v:foldend
      " let line = getline( linenum )
      " let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      " if comment_content != ''
        " break
      " endif
      " let linenum = linenum + 1
    " endwhile
    " let sub = initial . ' ' . comment_content
  " else
    " let sub = line
    " let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    " if startbrace == '{'
      " let line = getline(v:foldend)
      " let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      " if endbrace == '}'
        " let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      " endif
    " endif
  " endif
  " let n = v:foldend - v:foldstart + 1
  " let info = " " . n . " lines"
  " let sub = sub . "                                                                                                                  "
  " let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  " let fold_w = getwinvar( 0, '&foldcolumn' )
  " let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  " return sub . info
" endfunction
" set foldtext=MyFoldText()
nnoremap <Space> za
vnoremap <Space> za
nnoremap zO zCzO
nnoremap <leader>z zMzvzz

" }}}
" Search {{{
set wrapscan
set hlsearch
set incsearch
set ignorecase
set smartcase

" via http://www.kawaz.jp/pukiwiki/?vim
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" }}}
" IME {{{
set iminsert=0
set imsearch=0
set noimcmdline
set noimdisable
" }}}
" Mouse {{{
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" }}}
" Keymap"{{{

let mapleader="'"

nnoremap ; :

" move
nnoremap j gj
nnoremap k gk
noremap H ^
noremap L $
nnoremap J 5gj
nnoremap K 5gk

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

map <F6> :split<C-m>
map <F7> :vsp<C-m>

vnoremap v $h

" save, quit
nnoremap <Leader>ww :<C-u>w<CR>
nnoremap <Leader>wq :<C-u>wq<CR>
nnoremap <Leader>q :<C-u>q<CR>

" tab
nnoremap <C-n> gt
nnoremap <C-p> gT
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
nnoremap <Leader>td :<C-u>tabdo
nnoremap <Leader>tf :<C-u>tabfind
nnoremap <Leader>tm :<C-u>tabmove

" search
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" edit'
inoremap <C-d> <Del>
inoremap <C-h> <BackSpace>

inoremap <leader>date <C-R>=strftime('%A,  %B %d,  %Y')<CR>
inoremap <leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <leader>rdate <C-R>=strftime('%A,  %B %d,  %Y %H:%M')<CR>
inoremap <leader>wdate <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

"}}}
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
autocmd BufNewFile,BufRead *.less setlocal filetype=less
autocmd BufNewFile,BufRead *.less,*.css setlocal foldmethod=marker
autocmd BufNewFile,BufRead *.less,*.css setlocal foldmarker={,}
autocmd BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
autocmd BufNewFile,BufRead *.less,*.css command! Cleansort ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
autocmd FileType css,less setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" }}}
" JavaScript {{{
autocmd FileType javascript setlocal foldmethod=marker
autocmd FileType javascript setlocal foldmarker={,}
" }}}
" Python {{{
autocmd FileType python set expandtab
" }}}
" Ruby {{{
autocmd FileType ruby set shiftwidth=2 tabstop=2
" }}}
" Dotfile {{{
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
" }}}
" }}}
" Plugin setting {{{
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

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"Quick Type, ignore neocomplcache.
let g:NeoComplCache_SkipCompletionTime = '0.3'
let g:NeoComplCache_SkipInputTime = '0.1'
" }}}
" unite {{{
" let g:unite_enable_start_insert=1
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <Leader>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"}}}
" NERD_commentr {{{
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
nmap <c-o> <Plug>NERDCommenterToggle
vmap <c-o> <Plug>NERDCommenterToggle
nmap <Leader>cc <Plug>NERDCommenterAlignLeft
vmap <Leader>c  <Plug>NERDCommenterComment
nmap <Leader>C  <Plug>NERDCommenterToEOL
vmap <Leader>C  <Plug>NERDCommenterAlignLeft
nmap <Leader>u  <Plug>NERDCommenterUncomment
vmap <Leader>u  <Plug>NERDCommenterUncomment
nmap <Leader>xm <Plug>NERDCommenterMinimal
nmap <Leader>xs <Plug>NERDCommenterSexy
vmap <Leader>xm <Plug>NERDCommenterMinimal
vmap <Leader>xs <Plug>NERDCommenterSexy
nmap <Leader>xa <Plug>NERDCommenterAltDelims
" }}}
" autodate {{{
let g:autodate_format = ': %FT%T%z'
let g:autodate_keyword_pre = '$Date'
let g:autodate_keyword_post = '\$'
" }}}
" tagbar {{{
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
" }}}
" vimfiler {{{
nnoremap <F3> :VimFiler<CR>
nnoremap <F4> :VimFilerSimple<CR>
let g:vimfiler_as_default_explorer = 1
" }}}
" git-vim {{{
let g:git_command_edit='leftabove vnew'
" }}}
" vim-ref {{{
let g:ref_phpmanual_path=$HOME.'/Reference/php/php-chunked-xhtml'
" }}}
" closetag {{{
autocmd FileType html,xhtml,xml let b:closetag_html_style=1
autocmd FileType html,xhtml,xml sorce $HOME.'/.vim/bundles/closetag.vim/plugin/closetag.vim'
" }}}

" }}}
