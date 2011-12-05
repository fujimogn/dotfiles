#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/completion.zshrc
# $Date: 2011-12-05T21:49:16+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

fpath=(${ZDOTDIR}/modules/zsh-completions $fpath)
fignore=( .BAK .bak .alt .old .aux .toc .swp \~)

autoload -Uz compinit
compinit -d ${ZDOTTMP}/.zcompdump

zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' keep-prefix
# zstyle ':completion:*' list-colors di=34 ln=35 so=32 pi=33 ex=31 bd=46\;34 cd=43\;34 su=41\30 sg=46\30 tw=42\30 ow=43\30
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' prompt ''\''%e'\'''
zstyle ':completion:*' remove-all-dups true
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:corrections' format $Yellow'%B%d '$Red'(errors: %e)%b'$Reset
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format $Yellow'completing %B%d%b'$Reset
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:kill:*' command 'ps -u$USER'
zstyle ':completion:*:matches' group true
zstyle ':completion:*:messages' $Yellow'%d'$Reset
zstyle ':completion:*:options' description true
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:warnings' format $Red'No matches for:'$Yellow' %d'$Reset
zstyle ':completion::expand:*' tag-order 'expansions all-expansions'

# history
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu true
zstyle ':completion:*:history-words' remove-all-dups true
zstyle ':completion:*:history-words' stop true

# man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

# caching
zstyle ':completion:*' use-cache true
# zstyle ':completion::complete:*' cache-path ${ZDOTTMP}

# url auto quote
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# filetypes based completion
compctl -g '*.Z *.gz *.tgz' + -g '*' zcat zless zgrep gunzip gzip
compctl -g '*.bz2' + -g '*' bzip2 bunzip2
compctl -g '*.tar.Z *.tar.gz *.tgz *.tar.bz2' + -g '*' tar
compctl -g '*.zip *.ZIP' + -g '*' unzip zip
compctl -g '*(-/) *.pl *.PL *.cgi *.pm *.PM *.t *.xpl' perl
compctl -g '*(-/) *.pl *.PL *.pm *.PM *.pod' -K perldoc pod
compctl -g '*(-/) *.rb' ruby
compctl -g '*(-/) *.py *.pyc' python
compctl -g '*(-/) *.c' splint



