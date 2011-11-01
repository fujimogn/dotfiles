
set t_Co=<t_co>
colorscheme molokai
set background=dark

set guioptions=
set lines=60
set columns=90

" for MacVim-Kaoriya
if has('gui_macvim')
  " set guifont=Panic\ Sans:h13
  set guifont=MigMix\ 2M:h13
  " set transparency=2
endif

" C-Enter でフルスクリーンをトグル
nnoremap <C-Return> :set invfullscreen<CR>

" via http://vim-users.jp/2011/10/hack234
" augroup hack234
  " autocmd!
  " if has('mac')
    " autocmd FocusGained * set transparency=2
    " autocmd FocusLost * set transparency=50
  " endif
" augroup END


