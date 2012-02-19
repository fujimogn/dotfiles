#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/alias.zshrc
# $Date: 2012-02-20T04:29:35+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

alias e="$EDITOR"
alias q='exit'
alias h='history'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rr='rm -rf'
alias mkdir='mkdir -p'
alias la='ls -A'
alias ll='ls -hl'
alias lla='ll -A'
alias grep='grep --color=auto'
alias more=less
alias yum='sudo yum'
alias port='sudo port'
alias 644="chmod 644"
alias 755="chmod 755"

which anupack >/dev/null 2>&1 && alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=aunpack

alias -g G='| grep'
alias -g M='| more'
alias -g T='| tail'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g W='| wc'
