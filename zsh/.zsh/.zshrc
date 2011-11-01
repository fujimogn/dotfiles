#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zshrc
# $Date: 2011-11-01T22:22:06+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshrc_main() {

  autoload -Uz compinit
  compinit -d ${ZDOTTMP}/.zcompdump

  for file in ${ZDOTTMP}/.*.zshrc; source ${file}
  for file in ${ZDOTTMP}/.*.zsh; source ${file}

  unset file
}

zshrc_main
