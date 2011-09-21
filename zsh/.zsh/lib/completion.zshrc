#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/completion.zshrc
# $Date: 2011-09-22T04:22:41+0900$
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
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
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
zstyle ':completion:*:descriptions' format $Yellow'completing %d%b'$Reset
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


# auto-fu.zsh
__auto-fu() {
  if [ -f ${ZDOTDIR}/modules/auto-fu/auto-fu.zsh ]; then
    unsetopt sh_wordsplit autoremoveslash
    function () {
      local A
      A=${ZDOTDIR}/modules/auto-fu/auto-fu.zsh
      [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] ||
        zsh -c "source $A; auto-fu-zcompile $A ${A:h}" >/dev/null 2>&1
    }
    source ${ZDOTDIR}/modules/auto-fu/auto-fu; auto-fu-install
    zstyle ':auto-fu:var' postdisplay ''
    # zstyle ':auto-fu:var' track-keymap-skip opp
    # zstyle ':auto-fu:var' disable magic-space
    zstyle ':auto-fu:var' autoable-function/skipwords "^((??)##)"

    function zle-line-init () { auto-fu-init }
    zle -N zle-line-init

    # delete unambiguous prefix when accepting line
    # via: http://d.hatena.ne.jp/tarao/20100823/1282543408
    function afu+delete-unambiguous-prefix () {
      afu-clearing-maybe
      local buf; buf="$BUFFER"
      local bufc; bufc="$buffer_cur"
      [[ -z "$cursor_new" ]] && cursor_new=-1
      [[ "$buf[$cursor_new]" == ' ' ]] && return
      [[ "$buf[$cursor_new]" == '/' ]] && return
      ((afu_in_p == 1)) && [[ "$buf" != "$bufc" ]] && {
        # there are more than one completion candidates
        zle afu+complete-word
        [[ "$buf" == "$BUFFER" ]] && {
            # the completion suffix was an unambiguous prefix
            afu_in_p=0; buf="$bufc"
        }
        BUFFER="$buf"
        buffer_cur="$bufc"
      }
    }
    zle -N afu+delete-unambiguous-prefix
    function afu-ad-delete-unambiguous-prefix () {
      local afufun="$1"
      local code; code=$functions[$afufun]
      eval "function $afufun () { zle afu+delete-unambiguous-prefix; $code }"
    }
    afu-ad-delete-unambiguous-prefix afu+accept-line
    afu-ad-delete-unambiguous-prefix afu+accept-line-and-down-history
    afu-ad-delete-unambiguous-prefix afu+accept-and-hold
  fi
}

# __auto-fu

autoload -Uz compinit
compinit -d ${ZDOTDIR}/cache/.zcompdump
