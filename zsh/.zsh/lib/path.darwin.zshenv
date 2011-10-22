#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.darwin.zshenv
# $Date: 2011-10-22T22:22:04+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:


#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# xcode
export CC=/usr/bin/gcc-4.2
if [ -d /Developer/usr/bin ]; then
  export PATH=$PATH:/Developer/usr/bin
fi
# node
if [ -d /usr/local/lib/node ]; then
  export NODE_PATH=/usr/local/lib/node
fi
# npm
if [ -d /usr/local/lib/node_modules/npm/bin ]; then
  export PATH=$PATH:/usr/local/lib/node_modules/npm/bin
fi
# android-sdk
if [ -d /usr/local/Cellar/android-sdk ]; then
  ver=`ls -1v /usr/local/Cellar/android-sdk | tail -1`
  export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/${ver}
  unset ver
fi
