#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2011-11-18T00:32:00+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

## ${HOME}/bin
if [ -d "${HOME}/bin" ]; then
  export PATH=${HOME}/bin:${PATH}
fi

## ${DOTDIR}/bin
if [ -d "${DOTDIR}/bin" ]; then
  export PATH=${DOTDIR}/bin:${PATH}
fi

## Xcode
export CC=/usr/bin/gcc-4.2
if [ -d /Developer/usr/bin ]; then
  export PATH=$PATH:/Developer/usr/bin
fi

## ruby
if [ -d /usr/local/Cellar/ruby ]; then
  LASTEST=`ls -1v /usr/local/Cellar/ruby | tail -1`
  if [ -n ${LASTEST} ]; then
    export PATH=/usr/local/Cellar/ruby/${LASTEST}/bin:${PATH}
  fi
  unset LASTEST
fi

## rvm
if [ -s "/usr/local/rvm/scripts/rvm" ];then
  source "/usr/local/rvm/scripts/rvm"
  alias rvm="sudo rvm"
elif [ -s "${HOME}/.rvm/scripts/rvm" ]; then
  source "${HOME}/.rvm/scripts/rvm"
fi
if [[ "${rvm_bin_path}" != "${rvm_path}/bin" ]] ; then
  regex="^([^:]*:)*${rvm_bin_path}(:[^:]*)*$"
  if [[ ! "${PATH}" =~ $regex ]] ; then
    export PATH="${rvm_bin_path}:${PATH}"
  fi
fi

## pybrew
if [ -s "${HOME}/.pythonbrew/etc/bashrc" ]; then
  source ${HOME}/.pythonbrew/etc/bashrc
fi


## npm
if [ -d /usr/local/lib/node_modules/npm/bin ]; then
  export PATH=$PATH:/usr/local/lib/node_modules/npm/bin
fi

## android-sdk
if [ -d /usr/local/Cellar/android-sdk ]; then
  ver=`ls -1v /usr/local/Cellar/android-sdk | tail -1`
  export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/${ver}
  unset ver
fi

## Rsense
if [ -d /usr/lib/rsense ]; then
  export RSENSE_HOME=/usr/lib/rsense
fi

## Node.js
if [ -d /usr/local/lib/node ]; then
  export NODE_PATH=/usr/local/lib/node
fi
