#!/usr/bin/zsh
#
# $File: ${DOTDIR}/dircolors/dircolors.zsh
# $Date: 2011-09-18T05:06:51+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

case ${OSTYPE} in
  freebsd*|darwin*)
    alias ls="ls -FG"
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    ;;
  *)
    alias ls="ls -F --color=auto"
    ;;
esac

if  which dircolors > /dev/null 2>&1 ; then
  dircolors=${DOTDIR}/dircolors/dircolors/dircolors-${terminfo[colors]}
  if [[ -f $dircolors ]]; then
    eval $(dircolors -b $dircolors)
  else
    eval `dircolors`
  fi
  alias ls="ls -F --color=auto" # overwide ls for darwin
fi

export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
