#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/alias.zshrc
# $Date: 2011-09-11T21:32:43+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias rr="rm -rf"
alias mkdir="mkdir -p"

alias la="ls -A"
alias ll="ls -hl"
alias lla="ll -A"
alias l.="__ls 'ls -d .*'"
alias ll.="__ls 'ls -dhl .*'"
function __ls() {
  local dir
  dir=${PWD}
  if [[ -n "${2}" ]]; then
    dir=${2}
  fi
  (cd ${dir} && eval ${1})
}

alias grep='grep --color=auto'
prefix=(e f z ze zf bz)
for p in $prefix; do
  eval "alias ${p}grep='${p}grep --color=auto'"
done

alias df="df -kTh"
alias du="du -kh"
alias history="fc -l 1"
alias more="less"
alias where="command -v"
alias pd="pushd"
alias po="popd"

alias su="su -l"
alias _="sudo"
if [[ ! -x $(which sudoedit) ]]; then
      alias sudoedit='sudo -e'
fi
alias 644='chmod 644'
alias 755='chmod 755'

alias gd='dirs -lv; echo -n "select number: "; read newdir; cd +"$newdir"'

alias utf='export LANG=ja_JP.UTF-8; export LANGUAGE=ja_JP.UTF-8; export LC_ALL=ja_JP.UTF-8'
alias en='export LANG=en; export LANGUAGE=en; export LC_ALL=en'
alias eucjp='export LANG=ja_JP.eucJP; export LANGUAGE=ja_JP.eucJP; export LC_ALL=ja_JP.eucJP'
alias sjis='export LANG=ja_JP.SJIS; export LANGUAGE=ja_JP.SJIS; export LC_ALL=ja_JP.SJIS'

alias -g M='|more'
alias -g T='|tail'
alias -g V='| vim -R -'
alias -g H=' --help | head'
alias -g L=' --help | less'
alias -g N='|nkf -We'

# via http://d.hatena.ne.jp/mollifier/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then

  # Mac
  alias -g C='| pbcopy'
  alias -g P='`pbpaste`'
  alias p='pbpaste'

elif which xsel >/dev/null 2>&1 ; then

  # Linux
  alias -g C='| xsel --input --clipboard'

elif which putclip >/dev/null 2>&1 ; then

  # Cygwin
  alias -g C='| putclip'

fi