#!/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.zsh
# $Date: 2011-09-10T02:24:51+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

export EDITOR=vim

if [ is_darwin ]; then
  # for MacVim Kaoriya
  # http://code.google.com/p/macvim-kaoriya/
  # via http://piao-tech.blogspot.com/2008/10/open-new-files-as-tabs-in-current-vim.html
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
    # required command mvim
    # http://repo.or.cz/w/MacVim/KaoriYa.git/blob_plain/HEAD:/src/MacVim/mvim
    #
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
      alias gvim=gv
      alias g=gvim
    fi

    alias vi=v
    alias vim=v

  fi

fi

