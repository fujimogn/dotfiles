#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/export.darwin.zshrc
# $Date: 2012-10-02T02:16:44+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# OSX GCC Installer
# https://github.com/kennethreitz/osx-gcc-installer
export CC=/usr/bin/gcc-4.2

## android-sdk
if [ -d /usr/local/Cellar/android-sdk ]; then
  ver=`ls -1v /usr/local/Cellar/android-sdk | tail -1`
  export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/${ver}
  unset ver
fi

## Node.js
if [ -d /usr/local/lib/node ]; then
  export NODE_PATH=/usr/local/lib/node_modules
fi

# pybrew
if [ -s "${HOME}/.pythonbrew/etc/bashrc" ]; then
  source ${HOME}/.pythonbrew/etc/bashrc
  if [ -s "${HOME}/.pythonbrew/bin/virtualenvwrapper.sh" ]; then
    export VIRTUALENVWRAPPER_PYTHON=py2.7.2
    source ${HOME}/.pythonbrew/bin/virtualenvwrapper.sh
  fi
fi

## gisty
if [ -d "${HOME}/gist" ]; then
  export GISTY_DIR=${HOME}/gist
  export GISTY_ACCESS_TOKEN=08095b8bc8136b1b36d8107a904878f722d89ae1
  export GISTY_SSL_CA=`ruby -ropenssl -e 'p OpenSSL::X509::DEFAULT_CERT_FILE'`
  export GISTY_SSL_VERIFY="none"
fi


if [ -d /usr/local/var/postgres ]; then
  export PGDATA=/usr/local/var/postgres
fi
