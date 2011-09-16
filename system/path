#!/usr/bin/sh
#
# $File: ${DOTDIR}/system/path
# $Date: 2011-09-17T02:18:22+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:


if [ -d ${HOME}/bin ]; then
  export PATH=$PATH:$HOME/bin
fi

if [ -d ${DOTDIR}/bin ]; then
  export PATH=$PATH:$DOTDIR/bin
fi

if [[ $OSTYPE == darwin* ]]; then
  if [ -d /Developer/usr/bin ]; then
    export PATH=$PATH:/Developer/usr/bin
  fi
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
  export CC=/usr/bin/gcc-4.2
fi
