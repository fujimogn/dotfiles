#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zshrc
# $Date: 2011-09-22T04:23:07+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zshrc_main() {
  load_srcs ${ZDOTDIR}/lib/*.zshrc
  load_srcs ${ZDOTDIR}/misc/*.zsh
  load_srcs ${DOTDIR}/*/*.zsh
}

zshrc_main
