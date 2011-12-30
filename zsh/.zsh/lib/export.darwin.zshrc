#!/usr/bin/sh
#
# $File: ${ZDOTDIR}/lib/export.darwin.zshrc
# $Date: 2011-12-25T00:47:54+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

## android-sdk
if [ -d /usr/local/Cellar/android-sdk ]; then
  ver=`ls -1v /usr/local/Cellar/android-sdk | tail -1`
  export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/${ver}
  unset ver
fi

## Node.js
if [ -d /usr/local/lib/node ]; then
  export NODE_PATH=/usr/local/lib/node
fi

# OSX GCC Installer
# https://github.com/kennethreitz/osx-gcc-installer
export CC=/usr/bin/gcc-4.2
