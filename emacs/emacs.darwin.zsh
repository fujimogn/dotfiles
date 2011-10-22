#!/usr/bin/zsh
#
# $File: ${DOTDIR}/emacs/emacs.darwin.zsh
# $Date: 2011-10-22T23:07:54+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

if [ -d "/usr/local/Cellar/emacs/" ]; then
  lastest=`ls -1v /usr/local/Cellar/emacs/ | tail -1`
  if [ -n "${lastest:t}" ] && [ -x "/usr/local/Cellar/emacs/${lastest:t}/Emacs.app/Contents/MacOS/Emacs" ]; then
    alias emacs="/usr/local/Cellar/emacs/${lastest:t}/Emacs.app/Contents/MacOS/Emacs -nw"
  fi
fi
