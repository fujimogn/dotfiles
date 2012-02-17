#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/history.zshrc
# $Date: 2011-12-12T17:50:43+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

HISTFILE=${HOME}/.history/.zsh_history
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
