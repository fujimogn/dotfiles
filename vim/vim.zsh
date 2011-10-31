#!/usr/bin/zsh
#
# $file: ${DOTDIR}/vim/vim.zsh
# $date: 2011-10-30T17:31:22+0900$
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
