#!/usr/bin/env zsh
#
# $File: ${DOTDIR}/zsh/zshenv.symlink
# $Date: 2011-09-22T15:03:49+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

[ -f "${HOME}/.dotfilesrc" ] && source ${HOME}/.dotfilesrc
[ -z "${DOTDIR}" ] &&  export DOTDIR=${HOME}/.dotfiles
[ ! -d "${DOTDIR}" ] && echo "no such file or directory: ${DOTDIR}" >&2
[ -z ${ZDOTDIR} ] || [ -d ${HOME}/.zsh ] && export ZDOTDIR=${HOME}/.zsh
[ ! -d "${ZDOTDIR}" ] && echo "no such file or directory: ${ZDOTDIR}" >&2
[ -z ${ZDOTTEMP} ] && export ZDOTTMP=${ZDOTDIR}/.tmp
[ -f ${ZDOTDIR}/.zshenv ] && source ${ZDOTDIR}/.zshenv
