#!/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2012-02-29T16:59:06+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which tmux >/dev/null 2>&1 && return 1

alias t='tmux'
alias ta='tmux attach'
alias tls='tmux list-sessions'
alias tlw='tmux list-window'

TMUX_PROG="`whence tmux`"
[ -x "$TMUX_PROG" ] && [ -n "$TMUX" ] && alias exit="$TMUX_PROG detach"

function tmux-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/tmux/.tmux.conf
}
