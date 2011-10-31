#!/usr/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2011-10-30T04:07:35+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which tmux >/dev/null 2>&1 && return 1

fpath=(${DOTDIR}/tmux $fpath)

# if [ "$TERM" == 'xterm-256color']; then
# alias tmux='tmux $tmuxconf'
# fi

alias tm='tmux'
alias tma="tmux attach"
alias tmls='tmux list-sessions'

function tmux-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/tmux/.tmux.conf
}
