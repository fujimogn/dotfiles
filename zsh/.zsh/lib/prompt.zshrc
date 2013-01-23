#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/prompt.zshrc
# $Date: 2013-01-09T03:27:43+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
autoload colors && colors

# プロンプト内で変数展開
setopt prompt_subst

# function for PROMPT {{{

git-current-branch() {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi
  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color="%F{green}"
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color="%F{yellow}"
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color="%F{red}"
  else
    color="%F{red}"
  fi
  echo "on $color$name$action%f%b"
}

git-short-sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null)
  if [ $SHA ];then
    color="%B%F{black}"
    echo "$color<$SHA>%f%b"
  fi
}

git-since-commit() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
      now=`date +%s`
      seconds_since_last_commit=$((now-last_commit))
      MINUTES=$((seconds_since_last_commit / 60))
      HOURS=$((seconds_since_last_commit / (( 60 * 60 )) ))
      DAYS=$((seconds_since_last_commit / (( 60 * 60 * 60 )) ))

      SUB_HOURS=$((HOURS % 24))
      SUB_MINUTES=$((MINUTES % 60))

      if [ ${DAYS} -gt 1 ]; then
        mes="${DAYS} days ago"
      elif [ ${DAYS} -eq 1 ] || [ ${HOURS} -gt 24 ]; then
        mes="1 day ago"
      elif [ ${HOURS} -gt 1 ]; then
        mes="about ${HOURS} hours ago"
      elif [ ${HOURS} -eq 1 ]; then
        mes="about 1 hour ago"
      elif [ ${MINUTES} -gt 1 ]; then
        mes="${MINUTES} mimutes ago"
      elif [ ${MINUTES} -eq 1 ]; then
        mes="1 mimute ago"
      else
        mes="just now"
      fi

      color="%B%F{black}"
      echo "$color$mes%f%b"
    fi
  fi
}

rbenv_current_gemset() {
  if $(which rbenv &> /dev/null)
  then
    gemset_name=$(rbenv gemset active 2> /dev/null )
    [ -n "${gemset_name}" ] && echo "@${gemset_name}"
  fi
}

rbenv_prompt(){
  if $(which rbenv &> /dev/null)
  then
    echo "%B%F{yellow}$(rbenv version-name)$(rbenv_current_gemset)%f%b"
  else
    echo "system: $(ruby -v | cut -f-2 -d ' ')"
  fi
}

todo_prompt(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "%{$fg_bold[cyan]%}$todos%{$reset_color%}"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

git-and-current-dirname() {

  git_dir=`git rev-parse --show-toplevel 2> /dev/null`

  if [ -n "${git_dir}" ]; then
    if [ ${git_dir} -ef `pwd` ]; then
      # トップレベルだったときはリポジトリ名のみを表示
      echo "%{$fg_bold[green]%}${git_dir##*/}%{$reset_color%}"
    else
      # 下層の場合はリポジトリ名と現在のディレクトリを表示
      echo "%{$fg_bold[green]%}${git_dir##*/}/ %{$reset_color%}%{$fg_bold[blue]%}%1~%{$reset_color%}"
    fi
  else
    # 通常の非リポジトリの場合は現在のディレクトリを表示
    echo "%{$fg_bold[blue]%}%1~%\/%{$reset_color%}"
  fi
}


command_prefix(){
  # 前回のコマンドが正常に終了した場合緑、それ以外は赤
  echo "%0(?|%F{green}%%%f|%F{red}%%%f)"
}

# }}}
# set WINDOW title {{{
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
    ;;
  esac
}
# }}}
# set PROMPT # {{{

export PROMPT='
$(git-and-current-dirname) $(git-current-branch) $(git-short-sha) $(git-since-commit)
$(command_prefix) '

set_prompt () {
  export RPROMPT="$(todo_prompt) $(rbenv_prompt)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}

# }}}
