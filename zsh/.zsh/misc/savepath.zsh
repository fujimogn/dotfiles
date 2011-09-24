#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/misc/savepath.zsh
# $Date: 2011-09-22T15:09:05+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via https://github.com/ryanb/dotfiles

savepath() {
  pwd > ${ZDOTTMP}/.zpathdump
}

rmsavepath() {
  rm -f  ${ZDOTTMP}/.zpathdump
}
