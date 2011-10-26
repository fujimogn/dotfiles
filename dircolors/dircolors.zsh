#!/usr/bin/zsh
#
# $File: ${DOTDIR}/dircolors/dircolors.zsh
# $Date: 2011-10-24T02:14:54+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


DIRCOLORS=${HOME}/.dircolors

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

unset DIRCOLORS
