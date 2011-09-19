#!/usr/bin/zsh
#
# $File: ${DOTDIR}/homebrew/homebrew.darwin.zsh
# $Date: 2011-09-20T08:12:03+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which brew >/dev/null 2>&1 && return 1

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

_brew_fix_chmod() {
  sudo chown -R $USER `brew --prefix`
}

# via: https://gist.github.com/1173223
_brew_uninstall() {
  cd `brew --prefix`
  git ls-files -z | pbcopy
  rm -rf Cellar
  bin/brew prune
  pbpaste | xargs -0 rm
  rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions
  test -d Library/LinkedKegs && rm -r Library/LinkedKegs
  rmdir -p bin Library share/man/man1 2> /dev/null
  rm -rf .git
  rm -rf ~/Library/Caches/Homebrew
}

# via: https://github.com/mxcl/homebrew/wiki/Installation
# regular installation
_brew_install() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
}
