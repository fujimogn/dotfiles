#!/usr/bin/env zsh
#
# $File: ${DOTDIR}/zsh/zshenv.symlink
# $Date: 2011-09-15T15:41:59+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

load_dotfilesrc() {
  if [ -f ${HOME}/.dotfilesrc ]; then
    source ${HOME}/.dotfilesrc
  fi
}

load_systemenv() {
  if [ -n ${DOTDIR} ] && [ -d ${DOTDIR}/system ]; then
    for file in ${DOTDIR}/system/*
    do
      source ${file}
    done
  fi
}

set_zdotdir() {
  if [ !-n ${ZDOTDIR} ]; then
    export ZDOTDIR=${HOME}/.zsh
  fi
}

zshenv_main() {
  load_dotfilesrc
  load_systemenv
  set_zdotdir
}

zshenv_main
