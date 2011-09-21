#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zshenv
# $Date: 2011-09-22T06:35:12+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:
#
load_srcs() {
  [ -z "$1" ] && return 1
  function load_src() {
    local file=${ZDOTDIR}/cache/${${1##*/}%.*}
    if [ $1 -nt ${file}.zwc ] ||
        [ ! -f  ${file}.zwc ]; then
      cp $1 ${file} && zcompile ${file} && rm -f ${file}
    fi
    source ${file}
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

  unset -f load_src
  return 0
}

zshenv_main() {
  load_srcs ${ZDOTDIR}/lib/*.zshenv
}

zshenv_main
