#!/usr/bin/zsh
#
# $File: ${DOTDIR}/todo.txt/todo.txt.zsh
# $Date: 2011-10-20T13:53:11+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which todo.sh >/dev/null 2>&1 && return 1

function t() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

alias n="t ls +next"
