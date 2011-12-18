#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/.zshenv
# $Date: 2011-12-13T06:50:30+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshenv_main() {
  export PATH=$PATH:${ZDOTDIR}/bin
  for file in ${ZDOTTMP}/.*.zshenv; source ${file}
  unset file

  if [ -r "${HOME}/.zshenv.local" ]; then
    source ${HOME}/.zshenv.local
  fi
}

zshenv_main
