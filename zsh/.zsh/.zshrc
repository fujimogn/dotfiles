#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-17T11:38:00+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

load_modules() {
#  if [ -f ${ZDOTDIR}/modiles/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
#    source ${ZDOTDIR}/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
#  fi
#  if [ -f ${ZDOTDIR}/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#    source ${ZDOTDIR}/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#  fi
}

zshrc_main() {
  load_srcs ${ZDOTDIR}/lib/*.zshrc
  load_srcs ${ZDOTDIR}/plugins/*.zsh
  load_srcs in ${DOTDIR}/*/*.zsh
  load_modules
}

zshrc_main
