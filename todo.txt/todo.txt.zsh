#!/usr/bin/zsh
#
# $File: ${DOTDIR}/todo.txt/todo.txt.zsh
# $Date: 2011-11-11T08:52:39+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which todo.sh >/dev/null 2>&1 && return 1

function t() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

# compdef _todo.sh t

alias tn="t ls +next"
alias ta="t add"

function todo-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/todo.txt/.todo.cfg
}
