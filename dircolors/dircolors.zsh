

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
  fi
  # overwide ls for darwin
  alias ls="ls -F --color=auto"
fi

