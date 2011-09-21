#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/functions.zshrc
# $Date: 2011-09-22T03:39:57+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

#typeset -U fpath

if [ -d ${ZDOTDIR}/functions ]; then
  fpath=(${ZDOTDIR}/functions $fpath)
fi

# zsh-completions
if [ -d ${ZDOTDIR}/modules/zsh-completions ]; then
  fpath=(${ZDOTDIR}/modules/zsh-completions $fpath)
fi

autoload -U ${ZDOTDIR}/functions/*(:t)
