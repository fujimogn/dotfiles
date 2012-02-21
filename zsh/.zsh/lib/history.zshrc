#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/history.zshrc
# $Date: 2012-02-22T00:22:33+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


HISTFILE=${HOME}/.zsh_history

HISTIGNORE='?:??:rm *:\\rm *:r\\m *'
HISTSIZE=100000
SAVEHIST=100000

if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
