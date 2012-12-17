set t_Co=<t_co>
set anti
set guioptions=
set lines=60
set columns=90
set background=dark

" for MacVim-Kaoriya
if has('gui_macvim')
  set guifont=Ricty:h20
  " 透明度
  set transparency=2
  " フォーカスを離れたときに透明度を上げる
  " via http://vim-users.jp/2011/10/hack234
  augroup hack234
    autocmd!
    autocmd FocusGained * set transparency=2
    autocmd FocusLost * set transparency=50
  augroup END
endif

" <C-Enter> でフルスクリーンをトグル
nnoremap <C-Return> :set invfullscreen<CR>

