#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/completion.zshrc
# $Date: 2012-12-12T23:03:20+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

setopt always_last_prompt       # 補完してもプロンプトの位置を変えない。デフォルトで有効
# setopt always_to_end            # 補完時に文字列末尾へカーソル移動
setopt auto_list                # 補完候補が複数あるとき自動でメニューをリストアップ。デフォルトで有効
setopt auto_menu                # 補完要求に対してメニューをリストアップ。デフォルトで有効
setopt auto_param_keys          # カッコの対応などを自動的に補完。デフォルトで有効
setopt auto_param_slash         # ディレクトリ名の補完で末尾の / を自動的に付加。デフォルトで有効
# setopt auto_remove_slash        # 無駄な末尾の / を削除する。デフォルトで有効
# setopt complete_aliases         # 補完実行時にエイリアスを展開せずにそのままのコマンドとしてエイリアスを扱う
# setopt complete_in_word         # 語の途中でもカーソル位置で補完
# setopt extended_glob            # ファイル名で #,  ~,  ^ の 3 文字を正規表現として扱う
# setopt interactive_comments     # コマンドラインでも # 以降をコメントと見なす
setopt hash_list_all            # 最初のコマンド補完実行時にコマンドパスをハッシュする。デフォルトで有効
# setopt interactive_comments     # コマンドラインでも # 以降をコメントと見なす
setopt list_packed              # 補完候補を詰めて表示する
setopt list_types               # 補完候補で ls -F。デフォルトで有効
# setopt mark_dirs                # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
# setopt magic_equal_subst        # = 以降でも補完できるようにする
# setopt nullglob
setopt rec_exact                # 曖昧さがあっても正確なマッチ
unsetopt list_beep              # 曖昧な補完にビープ音を鳴らさない

WORDCHARS='*?_-.[]~=&;!#$%^(){}'
fpath=(${ZDOTDIR}/modules/zsh-completions/src $fpath)
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
zstyle ':completion:*' format '%F{yellow}Completing %d%f'
# zstyle ':completion:*' format 'Completing %d'

# PIDs
# zstyle ':completion:*:processes' command ps --forest -A -o pid,cmd
# zstyle ':completion:*:processes' list-colors '=(#b)( #[0-9]#)[^[/0-9a-zA-Z]#(*)=34=37;1=30;1'
# zstyle ':completion:*:(killall|pkill|kill):*' menu yes select
# zstyle ':completion:*:(killall|pkill|kill):*' force-list always

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

# sudo
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"


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


# # incremental completion
if [ -e "${ZDOTDIR}/modules/auto-fu/auto-fu.zsh" ]; then

  function () { # precompile
    local A
    A=${ZDOTDIR}/modules/auto-fu/auto-fu.zsh
    [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] || \
      zsh -c "source $A; auto-fu-zcompile $A ${A:h}" >/dev/null 2>&1
  }

  source ${ZDOTDIR}/modules/auto-fu/auto-fu.zsh

  zstyle ':auto-fu:highlight' input bold
  zstyle ':auto-fu:highlight' completion fg=white,dim
  zstyle ':auto-fu:highlight' completion/one fg=blue,dim
  zstyle ':auto-fu:var' postdisplay ''
  zstyle ':auto-fu:var' track-keymap-skip opp
  zstyle ':auto-fu:var' autoable-function/skiplbuffers '(npm)*'
  zstyle ':completion:*' completer _oldlist _complete

  function zle-line-init () { auto-fu-init }; zle -N zle-line-init
  zle -N zle-keymap-select auto-fu-zle-keymap-select

  function afu+cancel () {
    afu-clearing-maybe
    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur"; }
  }
  zle -N afu+cancel
  function bindkey-advice-before () {
    local key="$1"
    local advice="$2"
    local widget="$3"
    [[ -z "$widget" ]] && {
      local -a bind
      bind=(`bindkey -M main "$key"`)
      widget=$bind[2]
    }
    local fun="$advice"
    if [[ "$widget" != "undefined-key" ]]; then
      local code=${"$(<=(cat <<"EOT"
      function $advice-$widget () {
        zle $advice
        zle $widget
      }
      fun="$advice-$widget"
EOT
      ))"}
      eval "${${${code//\$widget/$widget}//\$key/$key}//\$advice/$advice}"
    fi
    zle -N "$fun"
    bindkey -M afu "$key" "$fun"
  }
  bindkey-advice-before "^G" afu+cancel
  bindkey-advice-before "^[" afu+cancel
  bindkey-advice-before "^J" afu+cancel afu+accept-line

  # delete unambiguous prefix when accepting line
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

