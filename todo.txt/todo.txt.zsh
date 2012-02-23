#!/bin/zsh
#
# $File: ${DOTDIR}/todo.txt/todo.txt.zsh
# $Date: 2012-02-23T12:16:02+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which todo.sh >/dev/null 2>&1 && return 1

function td() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

# compdef _todo.sh t

alias tdn="td ls +next"
alias tda="td add"

function todo-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/todo.txt/.todo.cfg
}
