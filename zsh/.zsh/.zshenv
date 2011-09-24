#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zshenv
# $Date: 2011-09-25T06:13:52+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshenv_main() {
  export PATH=$PATH:${ZDOTDIR}/bin
  for file in ${ZDOTTMP}/.*.zshenv; source ${file}
  unset file
}

zshenv_main
