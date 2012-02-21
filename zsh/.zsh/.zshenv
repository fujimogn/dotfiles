#!/bin/zsh
#
# $File: ${ZDOTDIR}/.zshenv
# $Date: 2012-02-22T00:40:16+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshenv_main() {

  export PATH=$PATH:${ZDOTDIR}/bin
  setopt nonomatch
  umask 022

  if ls ${ZDOTTMP}/.*.zshenv > /dev/null 2>&1; then
    for file in ${ZDOTTMP}/.*.zshenv; source ${file}
    unset file
  fi

  if [ -r "${HOME}/.zshenv.local" ]; then
    source ${HOME}/.zshenv.local
  fi
}

zshenv_main
