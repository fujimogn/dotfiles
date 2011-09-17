#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-17T07:26:41+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

load_modules() {
#  if [ -f ${ZDOTDIR}/modiles/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
#    source ${ZDOTDIR}/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
#  fi
#  if [ -f ${ZDOTDIR}/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#    source ${ZDOTDIR}/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#  fi
}

load_srcs() {

  load_src() {
    source $1
    echo "loaded: $1"
  }

  while [ $# -gt 0 ];
  do
    if [ -f $1 ]; then
      case $1 in
        *linux*)
          [[ $OSTYPE == linux* ]] && load_src $1
          ;;
        *solaris*)
          [[ $OSTYPE == solaris* ]] && load_src $1
          ;;
        *darwin*|*osx*|*mac*)
          [[ $OSTYPE == darwin* ]] && load_src $1
          ;;
        *cygwin*|*win*)
          [[ $OSTYPE == cygwin* ]] && load_src $1
          ;;
        *)
          load_src $1 break
          ;;
      esac
    fi
    shift
  done
}


zshrc_main() {
  load_srcs ${ZDOTDIR}/lib/*.zshrc
  load_srcs ${ZDOTDIR}/plugins/*.zsh
  load_srcs in ${DOTDIR}/*/*.zsh
  load_modules
  autoload -Uz compinit
  compinit
}

zshrc_main
