#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-16T10:14:23+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

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
  autoload -U compinit
  compinit
}

zshrc_main
