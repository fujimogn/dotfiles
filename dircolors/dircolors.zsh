

case ${OSTYPE} in
  darwin*)
    alias ls="ls -FG"
    ;;
  *)
    alias ls="ls -F --color=auto"
    ;;
esac

if  which dircolors > /dev/null 2>&1 ; then
  dircolors=${DOTDIR}/dircolors/dircolors/dircolors-${terminfo[colors]}
  if [[ -f $dircolors ]]; then
    eval $(dircolors -b $dircolors)
    alias ls="ls -F --color=auto" # overwide ls for darwin
    zstyle ':completion:*:default' list-colors ${LS_COLORS}
  fi
fi

