#!/bin/zsh
#
#
# $File: ${DOTDIR}/homebrew/homebrew.darwin.zsh
# $Date: 2012-02-22T00:45:02+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which brew >/dev/null 2>&1 && return 1

export PATH="$(brew --prefix)/bin:$PATH"
export PATH=/usr/local/sbin:$PATH

brew-fix-chmod() {
  sudo chown -R $USER `brew --prefix`
}

# via: https://gist.github.com/1173223
brew-uninstall-all() {
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
brew-install-first() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
}
