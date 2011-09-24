#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zlogin
# $Date: 2011-09-22T15:08:10+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# go to saved path if there is one
if [[ -f ${ZDOTTMP}/.zpathdump ]]; then
  cd `cat ${ZDOTTMP}/.zpathdump`
fi
