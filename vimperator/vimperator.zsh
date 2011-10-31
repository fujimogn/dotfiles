#!/usr/bin/zsh
#
# $File: ${DOTDIR}/vimperator/vimperator.zsh
# $Date: 2011-10-29T21:58:04+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

function vimperator-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/vimperator/.vimperatorrc
}
