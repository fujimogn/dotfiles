#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2012-02-23T15:27:43+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


export PATH=/usr/local/sbin:/usr/local/bin:$PATH

## ${HOME}/bin
if [ -d "${HOME}/bin" ]; then
  export PATH=${HOME}/bin:${PATH}
fi
