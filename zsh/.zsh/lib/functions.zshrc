#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/functions.zshrc
# $Date: 2011-12-05T21:55:47+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

fpath=(${ZDOTDIR}/functions $fpath)
autoload -U ${ZDOTDIR}/functions/*(:t)
