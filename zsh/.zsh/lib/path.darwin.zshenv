#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.darwin.zshenv
# $Date: 2013-01-12T22:01:29+0900$
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
if [ -d $(brew --prefix)/opt/php54/bin ]; then
  export PATH="$(brew --prefix)/opt/php54/bin:$PATH"
fi

### python
if [ -d $(brew --prefix)/lib/python2.7/site-packages ]; then
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
fi
