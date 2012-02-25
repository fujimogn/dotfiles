#!/bin/zsh
#
# $file: ${DOTDIR}/vim/vim.zsh
# $date: 2012-02-23T21:29:44+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

if which vim >/dev/null 2>&1 ; then

  # set export
  [ -z ${EDITOR} ] &&  export EDITOR=vim

  # alias
  alias v=vim
  alias gv=gvim

  # command completion
  compdef _vim v
  compdef _vim gv

  # Edit rcfile function
  function vim-edit-rc {
    ${EDITOR} ${DOTDIR}/vim/.vimrc
  }

  function gvim-edit-rc {
    ${EDITOR} ${DOTDIR}/vim/.gvimrc
  }

fi
