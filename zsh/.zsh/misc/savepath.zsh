#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/misc/savepath.zsh
# $Date: 2011-09-22T04:27:59+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via https://github.com/ryanb/dotfiles

savepath() {
  pwd > ${ZDOTDIR}/cache/.zpathdump
}

rmsavepath() {
  rm -f  ${ZDOTDIR}/cache/.zpathdump
}
