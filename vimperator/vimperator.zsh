#!/bin/zsh
#
# $File: ${DOTDIR}/vimperator/vimperator.zsh
# $Date: 2012-02-22T00:45:05+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

function vimperator-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/vimperator/.vimperatorrc
}
