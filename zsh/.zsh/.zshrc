#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zshrc
# $Date: 2011-09-26T11:37:18+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshrc_main() {
  for file in ${ZDOTTMP}/.*.zshrc; source ${file}
  for file in ${ZDOTTMP}/.*.zsh; source ${file}
  unset file
}

zshrc_main
