#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zlogout
# $Date: 2011-09-25T06:36:36+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zlogout_main() {
  zwc add --extention ~/.zshenv
  zwc add --extention ${ZDOTDIR}/.z*
  zwc add --ostype --extention --suffix . ${ZDOTDIR}/lib/* ${ZDOTTMP}
  zwc add --ostype --extention --suffix . ${ZDOTDIR}/misc/*.zsh ${ZDOTTMP}
  zwc add --ostype --extention --suffix . ${DOTDIR}/*/*.zsh ${ZDOTTMP}
}

zlogout_main
