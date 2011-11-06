#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2011-11-05T09:10:34+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

# ${HOME}/bin
if [ -d "${HOME}/bin" ]; then
  export PATH=${HOME}/bin:${PATH}
fi

# ${DOTDIR}/bin
if [ -d "${DOTDIR}/bin" ]; then
  export PATH=${DOTDIR}/bin:${PATH}
fi

# pybrew
if [ -s "${HOME}/.pythonbrew/etc/bashrc" ]; then
  source ${HOME}/.pythonbrew/etc/bashrc
fi

# rvm
if [ -s "${HOME}/.rvm/scripts/rvm" ]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

# Rsense
if [ -d /usr/lib/rsense ]; then
  export RSENSE_HOME=/usr/lib/rsense
fi

# Node.js
if [ -d /usr/local/lib/node ]; then
  export NODE_PATH=/usr/local/lib/node
fi

# npm
if [ -d /usr/local/lib/node_modules/npm/bin ]; then
  export PATH=$PATH:/usr/local/lib/node_modules/npm/bin
fi
