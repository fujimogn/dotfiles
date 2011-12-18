#!/usr/bin/zsh
#
# $file: ${DOTDIR}/vim/vim.zsh
# $date: 2011-12-16T02:21:14+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which vim >/dev/null 2>&1 && return 1


[ -z ${EDITOR} ] &&  export EDITOR=vim
[ -z ${VISUAL} ] &&  export VISUAL=vim

function vim-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/vim/.vimrc
}

function gvim-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/vim/.gvimrc
}

function vim-vundle {
  vim -c "execute \"BundleInstall\" | q | q"
}


function vim-vundle-update {
  vim -c "execute \"BundleInstall!\" | q | q"
}

# for sudo.vim
# via http://blog.monoweb.info/article/2011120320.html
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        args[$(( 1+$#args ))]="sudo:$arg"
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}
