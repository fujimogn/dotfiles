#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-09T22:48:35+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

load_commonrc() {
  if [ -f ${DOTDIR}/system/alias ]; then
    source ${DOTDIR}/system/alias
  fi
}


load_dotzshrc() {
  for dotzshrc in ${ZDOTDIR}/**/*.zshrc
  do
    source $dotzshrc
  done
}

load_dotzsh() {
  for dotzsh in ${DOTDIR}/**/*.zsh
  do
    source $dotzsh
  done
}

load_module() {
}

zshrc() {
  load_commonrc
  load_dotzshrc
  load_dotzsh
  autoload -U compinit
  compinit
}

zshrc

