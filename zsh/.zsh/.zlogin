#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zlogin
# $Date: 2011-09-22T03:41:30+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# go to saved path if there is one
if [[ -f ${ZDOTDIR}/cache/.current_path~ ]]; then
  cd `cat ${ZDOTDIR}/cache/.current_path~`
  rm -f ${ZDOTDIR}/cache/.current_path~
fi
