#!/usr/bin/zsh
#
# $file: ${DOTDIR}/earthquake/earthquake.zsh
# $date: 2011-10-29T19:12:41+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which earthquake >/dev/null 2>&1 && return 1

alias eq=earthquake

function earthquake-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/earthquake/.earthquake/config
}
