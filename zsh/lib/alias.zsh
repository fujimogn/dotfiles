source ${HOME}/.common/.alias

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
  alias p='pbpaste'
  alias -g P='`pbpaste`'

elif which xsel >/dev/null 2>&1 ; then

  # Linux
  alias -g C='| xsel --input --clipboard'

elif which putclip >/dev/null 2>&1 ; then

  # Cygwin
  alias -g C='| putclip'

fi

