#!/usr/bin/env zsh
#
# $File: ${DOTDIR}/zsh/zshenv.symlink
# $Date: 2011-09-22T03:27:23+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

[[ -f ${HOME}/.dotfilesrc ]] &&  source ${HOME}/.dotfilesrc
[[ -z ${ZDOTDIR} ]] && export ZDOTDIR=${HOME}/.zsh
[[ -f ${ZDOTDIR}/.zshenv ]] && source ${ZDOTDIR}/.zshenv
