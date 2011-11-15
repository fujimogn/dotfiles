#!/usr/bin/zsh
#
# $File: ${DOTDIR}/w3m/w3m.zsh
# $Date: 2011-11-08T08:19:21+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which w3m >/dev/null 2>&1 && return 1

export WWW_BROWSER=w3m
export HTTP_HOME="${HOME}/.w3m/bookmark.html"


function alc() {
  [ "$#" -eq 0 ] && return 1
  w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
  return 0
}

function google() {
  [ "$#" -eq 0 ] && return 1
  w3m "http://www.google.co.jp/search?ie=UTF-8&q=$*"
  return 0
}

function w3m-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/w3m/.w3m/config
}
