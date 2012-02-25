#!/usr/bin/env zsh
#
# $File: ${DOTDIR}/zsh/.zshenv
# $Date: 2012-02-24T07:23:38+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

if [ -f "${HOME}/.dotfilesrc" ]; then
  source ${HOME}/.dotfilesrc
fi

if [ -z "${DOTDIR}" ]; then
  export DOTDIR=${HOME}/.dotfiles
fi

if [ ! -d "${DOTDIR}" ]; then
  echo "no such file or directory: ${DOTDIR}" >&2
fi

if [ -z ${ZDOTDIR} ] || [ -d ${HOME}/.zsh ]; then
  export ZDOTDIR=${HOME}/.zsh
fi

if [ ! -d "${ZDOTDIR}" ]; then
  echo "no such file or directory: ${ZDOTDIR}" >&2
fi

if [ -z ${ZDOTTMP} ]; then
  export ZDOTTMP=${HOME}/.tmp/zsh
fi

if [ ! -d "${ZDOTTMP}" ]; then
  echo "no such file or directory: ${ZDOTTMP}" >&2
fi

if [ -f ${ZDOTDIR}/.zshenv ]; then
  source ${ZDOTDIR}/.zshenv
fi
