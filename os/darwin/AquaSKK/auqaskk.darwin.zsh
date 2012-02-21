#!/bin/zsh
#
# $File: ${DOTDIR}/os/darwin/aquaskk.darwin.zsh
# $Date: 2012-02-22T00:45:01+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


function aquaskk-uninstall {
  sudo rm -rf /Library/Input\ Methods/AquaSKK.app
  rm -rf ~/Library/Application\ Support/AquaSKK
  rm -rf ~/Library/Preferences/jp.sourceforge.inputmethod.aquaskk.plist
}
