#!/usr/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2011-10-29T02:53:34+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which tmux >/dev/null 2>&1 && return 1

fpath=(${DOTDIR}/tmux $fpath)

# if [ "$TERM" == 'xterm-256color']; then
# alias tmux='tmux $tmuxconf'
# fi

alias tmux='tmux'

alias t='tmux'
alias ta="tmux attach"
alias tls='tmux list-sessions'
