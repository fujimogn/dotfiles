#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/functions.zshrc
# $Date: 2011-09-11T22:28:18+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

typeset -U fpath

if [[ -d ${ZDOTDIR}'/functions' ]]; then
  fpath=(${ZDOTDIR}'/functions' $fpath)
fi
