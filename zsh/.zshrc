#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-10T03:47:34+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

load_systemrc() {
  if [ -d ${DOTDIR}/system ]; then
    for file in ${DOTDIR}/system/*.rc
    do
      source ${file}
    done
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
  if [ is_linux -eq "0" ]; then
    echo "test"
  fi
}

load_module() {
}

zshrc() {
  load_commonrc
  load_dotzshrc
  load_dotzsh
  load_module
  autoload -U compinit
  compinit
}

zshrc

