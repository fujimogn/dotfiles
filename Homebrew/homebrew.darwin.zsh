#!/usr/bin/zsh
#
# $File: ${DOTDIR}/homebrew/homebrew.darwin.zsh
# $Date: 2011-09-17T02:25:33+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which brew >/dev/null 2>&1 && return

export PATH="$(brew --prefix)/bin:$PATH"
export HOMEBREW_USE_GCC=1
export HOMEBREW_LIST_PATH=${DOTDIR}/homebrew
alias brews='brew list -1'

function brew_list() {

  local target\
        cmd\
        rcname=".brewlist"

  while [ $# -gt 0 ];
  do
    case $1 in
      "-*f*"|"--force")
        cmd+="rm -f \$target"
        break
        ;;
      *)
        target=$1
        ;;
    esac
    shift
  done

  target=${target:-${HOMEBREW_LIST_PATH:-$HOME}/${rcname}}
  cmd+=${cmd:-"brew list -1 > \$target"}
  eval `echo $cmd`
}

brew_fix_chmod() {
  sudo chown -R $USER `brew --prefix`
}


