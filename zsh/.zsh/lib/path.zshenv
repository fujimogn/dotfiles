#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2011-09-29T01:31:15+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:


if [ -d ${HOME}/bin ]; then
  export PATH=$PATH:$HOME/bin
fi

if [ -d ${DOTDIR}/bin ]; then
  export PATH=$PATH:$DOTDIR/bin
fi


