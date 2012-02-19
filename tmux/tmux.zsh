#!/usr/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2012-02-20T04:19:50+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which tmux >/dev/null 2>&1 && return 1

alias t='tmux'
alias ta='tmux attach -t'
alias tls='tmux list-sessions'
alias tlw='tmux list-window'

function tmux-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/tmux/.tmux.conf
}

