#!/bin/zsh
#
# $File: ${DOTDIR}/bin/bin.zsh
# $Date: 2011-09-10T07:38:22+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

mvim_update() {
  if [ `which curl` ]; then
    curl -O ${DOTDIR}/bin/bin.symlink/mvm "http://repo.or.cz/w/MacVim/KaoriYa.git/blob_plain/HEAD:/src/MacVim/mvim"
  fi
}

