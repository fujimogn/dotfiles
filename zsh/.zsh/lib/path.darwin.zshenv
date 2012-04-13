#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.darwin.zshenv
# $Date: 2012-03-05T04:49:44+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

cdpath=($HOME/Dropbox/Projects $HOME/Dropbox)

## Xcode
export CC=/usr/bin/gcc-4.2
if [ -d /Developer/usr/bin ]; then
  export PATH=$PATH:/Developer/usr/bin
fi

## MacUIM
if [ -d /Library/Frameworks/UIM.framework/Versions/Current/bin ]; then
  export PATH=$PATH:/Library/Frameworks/UIM.framework/Versions/Current/bin
fi

