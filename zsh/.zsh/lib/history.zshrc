#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/.history.zshrc
# $Date: 2011-09-22T15:20:14+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

HISTFILE=${ZDOTDIR}/.history
HISTIGNORE='?:??:rm *:\\rm *:r\\m *'
HISTSIZE=50000
SAVEHIST=50000
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

