#!/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.darwin.zsh
# $Date: 2012-02-27T09:18:36+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# for MacVim Kaoriya
# http://code.google.com/p/macvim-kaoriya/


if which vim >/dev/null 2>&1 ; then

  MACVIM="/Applications/MacVim.app/Contents/MacOS/Vim"

  if [ -e "${MACVIM}" ]; then
    alias {v,vi,vim}=${MACVIM}
    export EDITOR=${MACVIM}
    compdef _vim vim
    compdef _vim vi
    compdef _vim v
  fi

  if which mvim >/dev/null 2>&1 ; then
    alias {gv,gvim}=mvim
    compdef _vim gvim
  fi
fi
