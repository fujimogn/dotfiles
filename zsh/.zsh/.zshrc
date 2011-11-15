#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zshrc
# $Date: 2011-11-10T06:31:00+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshrc_main() {

  for file in ${ZDOTTMP}/.*.zshrc; source ${file}
  for file in ${ZDOTTMP}/.*.zsh; source ${file}
  unset file

  if [ -r "${HOME}/.zshrc.local" ]; then
    source ${HOME}/.zshrc.local
  fi
}

zshrc_main
