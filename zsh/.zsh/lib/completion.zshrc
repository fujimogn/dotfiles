#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/completion.zshrc
# $Date: 2011-09-17T05:12:46+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

#fignore=( .BAK .bak .alt .old .aux .toc .swp \~)

zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' prompt ''\''%e'\'''
zstyle ':completion:*' remove-all-dups true
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' verbose true
#zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
#zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
#zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
#zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:corrections' format $Yellow'%B%d '$Red'(errors: %e)%b'$Reset
zstyle ':completion:*:default' menu select=0                                                    # 選択状態をハイライトさせる
zstyle ':completion:*:descriptions' format $Yellow'completing %B%d%b'$Reset
#zstyle ':completion:*:expand:*' tag-order all-expansions
#zstyle ':completion:*:kill:*' command 'ps -u$USER'
#zstyle ':completion:*:matches' group true
#zstyle ':completion:*:messages' $Yellow'%d'$Reset
#zstyle ':completion:*:options' description true
#zstyle ':completion:*:processes' command 'ps -au$USER'
#zstyle ':completion:*:warnings' format $Red'No matches for:'$Yellow' %d'$Reset
#zstyle ':completion::expand:*' tag-order 'expansions all-expansions'

# history
# zstyle ':completion:*:history-words' list false
# zstyle ':completion:*:history-words' menu true
# zstyle ':completion:*:history-words' remove-all-dups true
# zstyle ':completion:*:history-words' stop true

# man
# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.*' insert-sections true
# zstyle ':completion:*:man:*' menu yes select

# the local web server details and host completion
# zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# caching
if [ -d $ZDOTDIR/cache ]; then
  zstyle ':completion:*' use-cache yes
  zstyle ':completion::complete:*' cache-path $ZDOTDIR/cache
fi

