#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zlogin
# $Date: 2011-09-22T04:27:18+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# go to saved path if there is one
if [[ -f ${ZDOTDIR}/cache/.zpathdump ]]; then
  cd `cat ${ZDOTDIR}/cache/.zpathdump`
fi
