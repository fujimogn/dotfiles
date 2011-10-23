#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2011-10-23T04:17:18+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

# ${HOME}/bin
if [ -d ${HOME}/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

# ${DOTDIR}/bin
if [ -d ${DOTDIR}/bin ]; then
  export PATH=$DOTDIR/bin:$PATH
fi

# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
