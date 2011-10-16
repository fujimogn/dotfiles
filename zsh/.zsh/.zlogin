#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zlogin
# $Date: 2011-09-22T15:08:10+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# keychain init
if which keychain 1>/dev/null 2>&1; then
  [ ! -r "${HOME}/.keycahin/${HOST}-sh" ] && keychain id_rsa github_rsa
  source ${HOME}/.keychain/${HOST}-sh
fi
# go to saved path if there is one
[ -f ${ZDOTTMP}/.zpathdump ] && cd `cat ${ZDOTTMP}/.zpathdump`

