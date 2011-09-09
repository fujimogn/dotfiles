if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd! BufRead,BufNewFile .vimperatorrc setfiletype vimperator
augroup END
