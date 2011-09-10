#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-10T14:06:09+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


load_systemrc() {
  if [ -d ${DOTDIR}/system ]; then
    for file in ${DOTDIR}/system/*
    do
      source ${file}
    done
  fi
}


load_dotzshrc() {
  for dotzshrc in `find ${ZDOTDIR} -type f -regex ".*/.[a-zA-Z0-9]*\.zshrc\$"` \
                  `is_cygwin && find ${ZDOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.cygwin\.zshrc\$"` \
                  `is_darwin && find ${ZDOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.darwin\.zshrc\$"` \
                  `is_linux && find ${ZDOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.linux\.zshrc\$"` \
                  `is_solaris && find ${ZDOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.solaris\.zshrc\$"`
  do
    source $dotzshrc
  done
}

load_dotzsh() {
  for dotzsh in `find ${DOTDIR} -type f -regex ".*/.[a-zA-Z0-9]*\.zsh\$"` \
                  `is_cygwin && find ${DOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.cygwin\.zsh\$"` \
                  `is_darwin && find ${DOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.darwin\.zsh\$"` \
                  `is_linux && find ${DOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.linux\.zsh\$"` \
                  `is_solaris && find ${DOTDIR} -path ${ZDOTDIR}/modules -prune -o -type f -regex ".*/.[a-zA-Z0-9]*\.solaris\.zsh\$"`
  do
    source $dotzsh
  done
}

load_module() {
}

zshrc_main() {
  #load_systemrc
  load_dotzshrc
  load_dotzsh
  load_module
  autoload -U compinit
  compinit
}

zshrc_main
