#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/alias.zshrc
# $Date: 2012-03-01T01:48:07+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

alias port="sudo port"

# 引数がなければカレントディレクトリを開く
function _open_cmd() {
  if [ $# -eq 0 ]; then
    open .
  else
    open $@
  fi
}
alias o=_open_cmd
