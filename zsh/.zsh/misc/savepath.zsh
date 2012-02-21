#!/bin/zsh
#
# $File: ${ZDOTDIR}/misc/savepath.zsh
# $Date: 2012-02-22T00:37:12+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via https://github.com/ryanb/dotfiles

savepath() {
  pwd > ${ZDOTTMP}/.zpathdump
}

rmsavepath() {
  rm -f  ${ZDOTTMP}/.zpathdump
}
