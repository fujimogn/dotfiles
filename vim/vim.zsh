#!/usr/bin/zsh
#
# $File: ${DOTDIR}/vim/vim.zsh
# $Date: 2011-09-12T15:57:20+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

export EDITOR=vim
export VISUAL=vim

function vundle() {
  if [ -n $1 ]; then
    case $1 in
      "update")
        vundle-init
        vim -c "execute \"BundleInstall!\" | q | q"
        ;;
      *) echo "unknown option$1" 2
        ;;
    esac
  else
    vundle-init
    vim -c "execute \"BundleInstall\" | q | q"
  fi
}

