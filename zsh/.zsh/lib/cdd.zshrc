#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/cdd.zshrc
# $Date: 2012-02-21T17:57:03+0900$
#

# cdd
# http://m4i.hatenablog.com/entry/2012/01/26/064329
#
if [ -e ${ZDOTDIR}/modules/cdd/cdd ]; then
  source ${ZDOTDIR}/modules/cdd/cdd

  chpwd() {
    _cdd_chpwd
  }
fi

