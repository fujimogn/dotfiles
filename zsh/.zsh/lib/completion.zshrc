#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/completion.zshrc
# $Date: 2012-02-19T16:33:25+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

fpath=(${ZDOTDIR}/modules/zsh-completions $fpath)
fignore=( .BAK .bak .alt .old .aux .toc .swp \~)

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

zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate _list _history
zstyle ':completion:*' list-separator '-->'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # tmux feeze!!!
# zstyle ':completion:*' format '%F{yellow}Completing %d%f'
zstyle ':completion:*' format 'Completing %d'

# PIDs
zstyle ':completion:*:processes' command ps --forest -A -o pid,cmd
zstyle ':completion:*:processes' list-colors '=(#b)( #[0-9]#)[^[/0-9a-zA-Z]#(*)=34=37;1=30;1'
zstyle ':completion:*:(killall|pkill|kill):*' menu yes select
zstyle ':completion:*:(killall|pkill|kill):*' force-list always

# hosts (background = red, foreground = black)
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'

# usernames (background = white, foreground = blue)
zstyle ':completion:*:*:*:*:users' list-colors '=*=34;47'

# history
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes

# man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

# approximation
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# caching
zstyle ':completion:*' use-cache true
zstyle ':completion::complete:*' cache-path ${ZDOTTMP}


autoload -U compinit
compinit -d ${ZDOTTMP}/.zcompdump

# zaw.zsh
if [ -e "$ZDOTDIR/modules/zaw/zaw.zsh" ];then
  source $ZDOTDIR/modules/zaw/zaw.zsh
  bindkey 'zh' zaw-history
  bindkey 'zc' zaw-cdr
  zstyle ':filter-select:highlight' matched fg=yellow,standout
  zstyle ':filter-select' max-lines 10
  zstyle ':filter-select' max-lines -10
  zstyle ':filter-select' case-insensitive yes
  zstyle ':filter-select' extended-search yes
fi


# incremental completion
if [ -e "${ZDOTDIR}/modules/auto-fu/auto-fu.zsh" ]; then
  source ${ZDOTDIR}/modules/auto-fu/auto-fu.zsh
  function auto-fu-init () {
    {
      local -a region_highlight
      local afu_in_p=0
      afu-recursive-edit-and-accept
      zle -I
    } always {
      POSTDISPLAY=''
    }
  }
  function zle-line-init () {
    auto-fu-init
  }
  zle -N zle-line-init
fi

