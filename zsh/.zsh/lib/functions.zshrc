#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/functions.zshrc
# $Date: 2011-11-06T02:02:26+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

fpath=(${ZDOTDIR}/functions $fpath)
autoload -U ${ZDOTDIR}/functions/*(:t)
