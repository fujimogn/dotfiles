#!/usr/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.darwin.zsh
# $Date: 2011-11-04T16:10:09+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# for MacVim Kaoriya
# http://code.google.com/p/macvim-kaoriya/
#
# required command mvim
# http://repo.or.cz/w/MacVim/KaoriYa.git/blob_plain/HEAD:/src/MacVim/mvim
#
# via http://piao-tech.blogspot.com/2008/10/open-new-files-as-tabs-in-current-vim.html
#
# alias command "v", "vi", "vi"   -> open CLI MacVim
# alias command "g", "gv", "gvim" -> open GUI MacVim
#

! which vim >/dev/null 2>&1 && return 1

VIMAPP="MacVim.app/Contents/MacOS/Vim"

APP_DIR="/Applications"
BREW_DIR="/usr/local/Cellar/macvim"

if [ -f "${APP_DIR}/${VIMAPP}" ]; then
  MACVIM="${APP_DIR}/${VIMAPP}"
elif [ -d "${BREW_DIR}" ]; then
  MACVIM=`find ${BREW_DIR} -maxdepth 1 -mindepth 1 -type d | tail -1`"/${VIMAPP}"
else
  return 1
fi

function v {
  if [ "$#" -eq "0" ]; then
    ${MACVIM} --servername VIMLOCAL
  else
    if [ `echo "$*" | grep -q -- "--servername"` ]; then
      ${MACVIM} --remote-tab-silent $*
    else
      ${MACVIM} --servername VIMLOCAL --remote-tab-silent $*
    fi
  fi
}

alias vi=v
alias vim=v
alias gvim=v
alias g=v

export EDITOR=v

if which mvim >/dev/null 2>&1; then
  function gv {
    if [ "$#" -eq "0" ]; then
      mvim --servername VIMLOCAL
    else
      if [ `echo "$*" | grep -q -- "--servername"` ]; then
        mvim --remote-tab-silent $*
      else
        mvim --servername GVIMLOCAL --remote-tab-silent $*
      fi
    fi
  }
  # override alias
  alias gvim=gv
  alias g=gv
fi

# compdef _vim v
# compdef _vim gv

unset VIMAPP APP_DIR BREW_DIR
