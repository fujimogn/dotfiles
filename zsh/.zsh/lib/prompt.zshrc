#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/prompt.zshrc
# $Date: 2011-12-25T00:59:01+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null



PROMPT='
%0(?|%F{green}%%%f|%F{red}%%%f) '
RPROMPT='%B%F{black}%n@%m%f%b %B%F{yellow}%T%f%b'

# PROMPT='
# %B%F{blue}%~%f%b `git-current-branch` %B%F{black}`git-short-sha` `git-since-commit`%f%b
# %0(?|%F{green}%%%f|%F{red}%%%f) '

# RPROMPT='%B%F{black}%n@%m%f%b %B%F{yellow}%T%f%b'

# function git-current-branch {
  # local name st color gitdir action
  # if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    # return
  # fi
  # name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  # if [[ -z $name ]]; then
    # return
  # fi
  # gitdir=`git rev-parse --git-dir 2> /dev/null`
  # action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
  # st=`git status 2> /dev/null`
  # if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # color=%F{green}
  # elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    # color=%F{yellow}
  # elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    # color=%B%F{red}
  # else
    # color=%F{red}
  # fi
  # echo "$color$name$action%f%b"
# }

# function git-short-sha() {
  # SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "<$SHA>"
# }

# function git-since-commit() {
  # if git rev-parse --git-dir > /dev/null 2>&1; then
    # # Only proceed if there is actually a commit.
    # if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      # # Get the last commit.
      # last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
      # now=`date +%s`
      # seconds_since_last_commit=$((now-last_commit))
      # # Totals
      # MINUTES=$((seconds_since_last_commit / 60))
      # HOURS=$((seconds_since_last_commit / (( 60 * 60 )) ))
      # DAYS=$((seconds_since_last_commit / (( 60 * 60 * 60 )) ))

      # SUB_HOURS=$((HOURS % 24))
      # SUB_MINUTES=$((MINUTES % 60))

      # if [ ${DAYS} -gt 1 ]; then
        # echo "${DAYS} days ago"
      # elif [ ${DAYS} -eq 1 ] || [ ${HOURS} -gt 24 ]; then
        # echo "1 day ago"
      # elif [ ${HOURS} -gt 1 ]; then
        # echo "about ${HOURS} hours ago"
      # elif [ ${HOURS} -eq 1 ]; then
        # echo "about 1 hour ago"
      # elif [ ${MINUTES} -gt 1 ]; then
        # echo "${MINUTES} mimutes ago"
      # elif [ ${MINUTES} -eq 1 ]; then
        # echo "1 mimute ago"
      # else
        # echo "just now"
      # fi
    # else
      # echo ""
    # fi
  # fi
# }


