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
filetype plugin indent on
" }}}
" RSense {{{

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
" unite {{{

let g:unite_enable_start_insert=1
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>uh :<C-u>Unite refe/
nnoremap <silent> <Space>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <Space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
autocmd FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType unite nnoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
autocmd FileType unite inoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
 "}}}
" NERD_commenter {{{

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

nmap <C-o> <Plug>NERDCommenterToggle
vmap <C-o> <Plug>NERDCommenterToggle
vmap <Space>c <Plug>NERDCommenterToggle
nmap <Space>c <Plug>NERDCommenterToggle
nmap <Space>xm <Plug>NERDCommenterMinimal
nmap <Space>xs <Plug>NERDCommenterSexy
vmap <Space>xm <Plug>NERDCommenterMinimal
vmap <Space>xs <Plug>NERDCommenterSexy
nmap <Space>xa <Plug>NERDCommenterAltDelims

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
autocmd FileType tagbar nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType tagbar nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType tagbar inoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
autocmd FileType tagbar inoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
" }}}
" vim-ref {{{

let g:ref_phpmanual_path = $HOME.'/Reference/php/php-chunked-xhtml'

" }}}
" quickrun {{{
"<Leader>r を使わない
let g:quickrun_no_default_key_mappings = 1
" quickrun_configの初期化
if !has("g:quickrun_config")
  let g:quickrun_config = {}
endif
nmap <silent><Space>r <Plug>(quickrun)<CR>
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
autocmd FileType quickrun nnoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>
autocmd FileType quickrun inoremap <silent> <buffer> <Space><Space> <ESC>:q<CR>

" }}}

