#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/alias.zshrc
# $Date: 2011-11-01T22:47:33+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rr='rm -rf'
alias mkdir='mkdir -p'

alias la='ls -A'
alias ll='ls -hl'
alias lla='ll -A'
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
unset prefix

alias cl=clear
alias df='df -kTh'
alias du='du -kh'
alias hi='fc -l 1'
alias pd=pushd
alias po=popd

alias more=less
alias where='command -v'

# alias t='tar zxvf'
# alias t-='tar xvf -'
# alias b='bzip2 -dc'

alias yum='sudo yum'
alias port='sudo port'

alias {q,q!}=exit

alias su='su -l'
if [[ ! -x $(which sudoedit) ]]; then
      alias sudoedit='sudo -e'
fi

alias 644="chmod 644"
alias 755="chmod 755"

alias gd='dirs -lv; echo -n "select number: "; read newdir; cd +"$newdir"'

alias set_utf='export LANG=ja_JP.UTF-8; export LANGUAGE=ja_JP.UTF-8; export LC_ALL=ja_JP.UTF-8'
alias set_en='export LANG=en; export LANGUAGE=en; export LC_ALL=en'
alias set_eucjp='export LANG=ja_JP.eucJP; export LANGUAGE=ja_JP.eucJP; export LC_ALL=ja_JP.eucJP'
alias set_sjis='export LANG=ja_JP.SJIS; export LANGUAGE=ja_JP.SJIS; export LC_ALL=ja_JP.SJIS'

alias py=python
alias irb='irb --readline -r irb/completion'

alias -g G='| grep'
alias -g M='| more'
alias -g T='| tail'
alias -g H='| head'
alias -g L='| less'

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
