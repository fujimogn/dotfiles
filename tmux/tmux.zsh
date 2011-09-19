#!/usr/bin/zsh
#
# $File: ${DOTDIR}/tmux/tmux.zsh
# $Date: 2011-09-20T08:11:30+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which tmux >/dev/null 2>&1 && return 1

fpath=(${DOTDIR}/tmux $fpath)

# Attache tmux
# if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
#   if ( tmux has-session ); then
#     session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
#     if [ -n "$session" ]; then
#       echo "Attache tmux session $session."
#       tmux attach-session -t $session
#     else
#       echo "Session has been already attached."
#       tmux list-sessions
#     fi
#   else
#     echo "Create new tmux session."
#     tmux
#   fi
# fi
