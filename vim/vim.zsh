#!/bin/zsh
#
# $file: ${DOTDIR}/vim/vim.zsh
# $date: 2012-02-27T09:19:12+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

if which vim >/dev/null 2>&1 ; then

  # Edit rcfile function
  function vim-edit-rc {
    ${EDITOR} ${DOTDIR}/vim/.vimrc
  }

  function gvim-edit-rc {
    ${EDITOR} ${DOTDIR}/vim/.gvimrc
  }

fi
