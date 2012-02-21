#!/bin/zsh
#
# $File: ${DOTDIR}/dircolors/dircolors.zsh
# $Date: 2012-02-22T00:45:01+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which git >/dev/null 2>&1 && return 1

alias g=git

function git-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/git/.gitconfig
}
