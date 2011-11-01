#!/bin/zsh
#
# $File: ${ZDOTDIR}/misc/cleanmemory.darwin.zsh
# $Date: 2011-11-01T22:37:26+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


for p in ${ZDOTDIR}/lib/*
do
  eval "function zsh-edit-${${${p##*/}%.*}/./-} { ${EDITOR-vi} ${p} }"
done


for p in ${ZDOTDIR}/{.zshenv,.zshrc,.zlogin,.zlogout}
do
  eval "function zsh-edit-${${p##*/}/(.zsh|.z)/} { ${EDITOR-vi} ${p} }"
done
unset p
