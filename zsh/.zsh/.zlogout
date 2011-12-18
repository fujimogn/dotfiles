#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/.zlogout
# $Date: 2011-12-12T17:51:24+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zlogout_main() {
  zwc add --extension ~/.zshenv
  zwc add --extension ${ZDOTDIR}/.z*
  zwc add --ostype --extension --suffix . ${ZDOTDIR}/lib/* ${ZDOTTMP}
  zwc add --ostype --extension --suffix . ${ZDOTDIR}/misc/*.zsh ${ZDOTTMP}
  zwc add --ostype --extension --suffix . ${DOTDIR}/**/*.zsh ${ZDOTTMP}
}

zlogout_main
