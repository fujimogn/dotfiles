filetype plugin on

let $PATH = $PATH.':/usr/local/bin/'.':'.$HOME.'/bin'
set clipboard+=autoselect
set clipboard+=unnamed
set autoread
set autowrite
set confirm
set hidden
set helplang=ja,en

autocmd bufwritepre * :%s/\s\+$//ge

