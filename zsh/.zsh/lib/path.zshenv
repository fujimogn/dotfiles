#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2012-02-19T16:20:25+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

## ${HOME}/bin
if [ -d "${HOME}/bin" ]; then
  export PATH=${HOME}/bin:${PATH}
fi

## ${DOTDIR}/bin
if [ -d "${DOTDIR}/bin" ]; then
  export PATH=${DOTDIR}/bin:${PATH}
fi

# rbenv
if which rbenv >/dev/null 2>&1 ; then
  eval "$(rbenv init -)"
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
if which gisty >/dev/null 2>&1 ; then
  export GISTY_DIR=${HOME}/gist
  export GISTY_SSL_CA=`ruby -ropenssl -e 'p OpenSSL::X509::DEFAULT_CERT_FILE'`
  export GISTY_SSL_VERIFY="none"
fi

