#!/usr/bin/zsh
#
# $file: ${DOTDIR}/vim/vim.zsh
# $date: 2011-11-06T02:55:28+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which vim >/dev/null 2>&1 && return 1


[ -z ${EDITOR} ] &&  export EDITOR=vim
[ -z ${VISUAL} ] &&  export VISUAL=vim

function vim-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/vim/.vimrc
}

function gvim-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/vim/.gvimrc
}

function vim-vundle {
  vim -c "execute \"BundleInstall\" | q | q"
}


function vim-vundle-update {
  vim -c "execute \"BundleInstall!\" | q | q"
}
