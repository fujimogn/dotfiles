#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/alias.zshrc
# $Date: 2013-01-12T19:55:23+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

alias port="sudo port"

# 引数がなければカレントディレクトリを開く
function _open_cmd(){
  if [ $# -eq 0 ]; then
    open .
  else
    open $@
  fi
}
alias o=_open_cmd


# Kyokoたん
function _say_kyoko(){
  if [ $# -eq 1 ]; then
    say -v Kyoko $@
  else
    say $@
  fi
}
alias say=_say_kyoko


alias cvlc='/Applications/VLC.app/Contents/MacOS/VLC --intf=rc'
