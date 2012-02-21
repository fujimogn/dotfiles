#!/bin/zsh
#
# $File: ${DOTDIR}/emacs/emacs.darwin.zsh
# $Date: 2012-02-22T00:45:00+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

if [ -d "/usr/local/Cellar/emacs/" ]; then
  lastest=`ls -1v /usr/local/Cellar/emacs/ | tail -1`
  if [ -n "${lastest:t}" ] && [ -x "/usr/local/Cellar/emacs/${lastest:t}/Emacs.app/Contents/MacOS/Emacs" ]; then
    alias emacs="/usr/local/Cellar/emacs/${lastest:t}/Emacs.app/Contents/MacOS/Emacs -nw"
  fi
fi
