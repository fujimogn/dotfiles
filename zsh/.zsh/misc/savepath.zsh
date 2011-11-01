#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/misc/savepath.zsh
# $Date: 2011-11-01T19:27:14+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via https://github.com/ryanb/dotfiles

savepath() {
  pwd > ${ZDOTTMP}/.zpathdump
}

rmsavepath() {
  rm -f  ${ZDOTTMP}/.zpathdump
}
