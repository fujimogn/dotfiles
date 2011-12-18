#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/functions.zshrc
# $Date: 2011-12-12T17:50:26+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

fpath=(${ZDOTDIR}/functions $fpath)
autoload -U ${ZDOTDIR}/functions/*(:t)
