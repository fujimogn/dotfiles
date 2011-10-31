#!/usr/bin/zsh
#
# $File: ${DOTDIR}/dircolors/dircolors.zsh
# $Date: 2011-10-29T18:56:07+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which git >/dev/null 2>&1 && return 1

alias gi=git

function git-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/git/.gitconfig
}
