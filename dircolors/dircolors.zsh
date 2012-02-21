#!/bin/zsh
#
# $File: ${DOTDIR}/dircolors/dircolors.zsh
# $Date: 2012-02-22T00:45:00+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

function dircolors_main {

  LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.tar=01;31'
  export LS_COLORS

  local DIRCOLORS=${HOME}/.dircolors

  if which dircolors > /dev/null 2>&1 ; then
    if [ -f "${DIRCOLORS}" ]; then
      eval $(dircolors -b ${DIRCOLORS})
    else
      eval `dircolors`
    fi
    alias ls="ls -F --color=auto"
  fi

  # coreutils
  if which gdircolors > /dev/null 2>&1 ; then
    if [[ -f ${DIRCOLORS} ]]; then
      eval $(gdircolors -b ${DIRCOLORS})
    else
      eval `gdircolors`
    fi
    alias ls="gls -F --color=auto"
  fi

  export ZLS_COLORS=${LS_COLORS}
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

}

function dircolors-edit-rc {
    ${EDITOR-vi} ${DOTDIR}/dircolors/dircolors.yml
}

function dircolors-reload-rc {
    local OLD_PWD=`pwd`
    cd ${DOTDIR}/dircolors && python dircolors.py
    cd ${OLD_PWD}
    dircolors_main
}

dircolors_main
