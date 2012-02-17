#!/usr/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2011-11-01T08:36:01+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which tmux >/dev/null 2>&1 && return 1

alias tm='tmux'
alias tma="tmux attach"
alias tmls='tmux list-sessions'
alias tmlw='tmux list-window'

function tmux-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/tmux/.tmux.conf
}
