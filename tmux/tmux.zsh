#!/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2013-01-12T20:18:07+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


if which tmux 1>/dev/null 2>&1; then

  alias tm='tmux'
  alias tma='tmux attach'
  alias tmls='tmux list-sessions'
  alias tmlw='tmux list-window'

  TMUX_PROG="`whence tmux`"
  if [ -x "$TMUX_PROG" ] && [ -n "$TMUX" ]; then
    alias exit="$TMUX_PROG detach"
    alias exit!="$TMUX_PROG kill-session"
  fi

  function tmux-edit-rc {
    ${EDITOR-vi} ${DOTDIR}/tmux/.tmux.conf
  }

  if [ $TERM = screen ]; then
    function mosh_tmux() {
      tmux new-window -n $@ "exec mosh $@"
    }
    alias mosh=mosh_tmux
  fi

fi
