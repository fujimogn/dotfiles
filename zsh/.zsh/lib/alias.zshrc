#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/alias.zshrc
# $Date: 2012-02-25T18:06:59+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# my heavy use !!
alias {e,edit}="$EDITOR"
alias {q,quit}="exit"
alias {h,history}="history -n -10"
alias c="clear"

alias mkdir="mkdir -p"
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla="ll -a"
alias ld='ls -d'
alias lt='tree -F'
alias lz="ll -Z"
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias more=less
alias emacs="emacs -nw"
alias yum="sudo yum"
alias port="sudo port"
alias 644="chmod 644"
alias 755="chmod 755"
alias ymd='date +%y%m%d'

# for atools
if [ -x "`whence aunpack`" ]; then
  alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=aunpack
fi

# global alias
alias -g G="| grep"
alias -g M="| more"
alias -g T="| tail"
alias -g H="| head"
alias -g L="| less"
alias -g S="| sort"
alias -g W="| wc"
alias -g NUL="> /dev/null 2>&1"

# send to clipboad
# via http://d.hatena.ne.jp/mollifier/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  alias -g C='| putclip'
fi
