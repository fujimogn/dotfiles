#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2011-10-22T22:11:01+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:


if [ -d ${HOME}/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

if [ -d ${DOTDIR}/bin ]; then
  export PATH=$DOTDIR/bin:$PATH
fi

# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
