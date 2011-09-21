#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/misc/openurl.zsh
# $Date: 2011-09-22T04:07:20+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via https://github.com/sjl/dotfiles/blob/master/zsh/urls.zsh

function openurl() {
  open "http://$*"
}

alias -s com=openurl
alias -s org=openurl
alias -s net=openurl
alias -s io=openurl
alias -s jp=openurl

