#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshenv
# $Date: 2011-09-22T03:30:49+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:
#
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
          load_src $1
          ;;
      esac
    fi
    shift
  done
}


zshenv_main() {
  load_srcs ${ZDOTDIR}/lib/*.zshenv
}

zshenv_main
