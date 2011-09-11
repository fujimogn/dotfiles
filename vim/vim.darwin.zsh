#!/usr/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.darwin.zsh
# $Date: 2011-09-11T12:17:27+0900$
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

MACVIM="/Applications/MacVim.app/Contents/MacOS/Vim"

if [ -f $MACVIM ]; then

  function v {
    if [ "$#" -eq "0" ]; then
      $MACVIM --servername VIMLOCAL
    else
      if [ `echo "$*" | grep -q -- "--servername"` ]; then
        $MACVIM --remote-tab-silent $*
      else
        $MACVIM --servername VIMLOCAL --remote-tab-silent $*
      fi
    fi
  }

  alias gvim=v

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
    alias g=gvim
  fi

  alias vi=v
  alias vim=v

fi
