#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/export.darwin.zshrc
# $Date: 2012-12-13T00:40:01+0900$
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
# if [ -d /usr/local/lib/node ]; then
  # export NODE_PATH=/usr/local/lib/node_modules
# fi

## nvm
if [[ -s $HOME/.nvm ]] ; then
  setopt nullglob
  export NVM_DIR=$HOME/.nvm
  source $NVM_DIR/nvm.sh

  if which nvm >/dev/null 2>&1 ;then
    _nodejs_use_version="v0.8.15"
    if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
      nvm use "${_nodejs_use_version}" >/dev/null
      export NODE_PATH=${NVM_PATH}_modules${NODE_PATH:+:}${NODE_PATH}
    fi
    unset _nodejs_use_version
  fi

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
if [ -d "${HOME}/gists" ]; then
  export GISTY_DIR="${HOME}/gists"
  export GISTY_ACCESS_TOKEN="ddacac16b1e322c18db9e4c04a86182f375cc156"
  export GISTY_SSL_VERIFY="NONE"
fi

## postgres
if [ -d /usr/local/var/postgres ]; then
  export PGDATA=/usr/local/var/postgres
fi
