#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zshrc
# $Date: 2011-09-15T16:29:42+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

load_src() {

  function load(){
    source $1
    echo "loaded: $1"
  }

  while [ $# -gt 0 ];
  do
    if [ -f $1 ]; then
      case $1 in
        *linux*)
          [[ $OSTYPE == linux* ]] && load $1
          ;;
        *solaris*)
          [[ $OSTYPE == solaris* ]] && load $1
          ;;
        *darwin*|*osx*|*mac*)
          [[ $OSTYPE == darwin* ]] && load $1
          ;;
        *cygwin*|*win*)
          [[ $OSTYPE == cygwin* ]] && load $1
          ;;
        *)
          load $1 break
          ;;
      esac
    fi
    shift
  done
}

load_dotzshrc() {
  load_src ${ZDOTDIR}/lib/*.zshrc
}

load_dotzsh() {
  load_src in ${DOTDIR}/*/*.zsh
}

load_module() {
}

zshrc_main() {
  load_dotzshrc
  load_dotzsh
  load_module
  autoload -U compinit
  compinit
}

zshrc_main

echo "loaded: .zshrc"
