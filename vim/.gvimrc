
set t_Co=<t_co>
colorscheme molokai_fujimogn
set background=dark

set guioptions=

" for MacVim-Kaoriya
if has('gui_macvim')
  set guifont=Ricty:h12
  set transparency=5
endif

" via http://vim-users.jp/2011/10/hack234
augroup hack234
  autocmd!
  if has('mac')
    autocmd FocusGained * set transparency=5
    autocmd FocusLost * set transparency=50
  endif
augroup END
