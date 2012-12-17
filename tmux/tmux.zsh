#!/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2012-12-16T00:58:54+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


if which tmux 1>/dev/null 2>&1; then

  alias tm='tmux'
  alias tma='tmux attach'
  alias tmls='tmux list-sessions'
  alias tmlw='tmux list-window'

  TMUX_PROG="`whence tmux`"
  [ -x "$TMUX_PROG" ] && [ -n "$TMUX" ] && alias exit="$TMUX_PROG detach"

  function tmux-edit-rc {
    ${EDITOR-vi} ${DOTDIR}/tmux/.tmux.conf
  }

fi
