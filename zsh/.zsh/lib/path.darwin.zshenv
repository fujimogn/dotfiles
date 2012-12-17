#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.darwin.zshenv
# $Date: 2012-12-04T23:01:26+0900$
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

## php
if [ -d $(brew --prefix josegonzalez/php/php54)/bin ]; then
  export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
fi
