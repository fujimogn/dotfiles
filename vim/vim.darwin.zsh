#!/usr/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.darwin.zsh
# $Date: 2011-11-06T13:19:59+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# for MacVim Kaoriya
# http://code.google.com/p/macvim-kaoriya/

! which vim >/dev/null 2>&1 && return 1

VIMAPP="MacVim.app/Contents/MacOS/Vim"
APP_DIR="/Applications"
BREW_DIR="/usr/local/Cellar/macvim"

if [ -f "${APP_DIR}/${VIMAPP}" ]; then
  MACVIM="${APP_DIR}/${VIMAPP}"
elif [ -d "${BREW_DIR}" ]; then
  MACVIM=`find ${BREW_DIR} -maxdepth 1 -mindepth 1 -type d | tail -1`"/${VIMAPP}"
else
  return 1
fi

alias v=${MACVIM}
alias vi=${MACVIM}
alias vim=${MACVIM}

compdef _vim v
compdef _vim vi
compdef _vim vim

export EDITOR=${MACVIM}

unset VIMAPP APP_DIR BREW_DIR
