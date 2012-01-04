#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/alias.zshrc
# $Date: 2011-12-31T01:05:39+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

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

alias gd='dirs -lv; echo -n "select number: "; read newdir; cd +"$newdir"'

alias -g G='| grep'
alias -g M='| more'
alias -g T='| tail'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g W='| wc'

# via http://d.hatena.ne.jp/mollifier/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  alias -g C='| pbcopy'
  alias -g P='`pbpaste`'
  alias p='pbpaste'
elif which xsel >/dev/null 2>&1 ; then
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  alias -g C='| putclip'
fi
