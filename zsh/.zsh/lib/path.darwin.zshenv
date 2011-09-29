#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.darwin.zshenv
# $Date: 2011-09-29T01:49:52+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# xcode
export CC=/usr/bin/gcc-4.2
[ -d /Developer/usr/bin ] && export PATH=$PATH:/Developer/usr/bin
# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
# node
[ -d /usr/local/lib/node ] && export NODE_PATH=/usr/local/lib/node
# npm
[ -d /usr/local/lib/node_modules/npm/bin ] && export PATH=$PATH:/usr/local/lib/node_modules/npm/bin
# android-sdk
[ -d /usr/local/Cellar/android-sdk ] && export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r12
