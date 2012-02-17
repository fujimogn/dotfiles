#!/usr/bin/zsh
#
# $File: ${DOTDIR}/.zshrc
# $Date: 2011-12-12T17:52:37+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshrc_main() {

  setopt nonomatch

  if ls ${ZDOTTMP}/.*.zshrc > /dev/null 2>&1; then
    for file in ${ZDOTTMP}/.*.zshrc; source ${file}
    unset file
  fi

  if ls ${ZDOTTMP}/.*.zsh > /dev/null 2>&1; then
    for file in ${ZDOTTMP}/.*.zsh; source ${file}
    unset file
  fi

  if [ -r "${HOME}/.zshrc.local" ]; then
    source ${HOME}/.zshrc.local
  fi
}

zshrc_main
