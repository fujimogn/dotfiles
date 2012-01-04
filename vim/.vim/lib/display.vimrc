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
set number
set laststatus=2
set showtabline=2
set showmatch
set showcmd
set showmode
set virtualedit+=block
set textwidth=80

if exists('&colorcolumn')
  set colorcolumn=+1
endif

augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END


