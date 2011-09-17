#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/abbreviations.zshrc
# $Date: 2011-09-17T12:03:12+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via: http://hackerific.net/2009/01/23/zsh-abbreviations/

__abbreviations() {

  typeset -A abbrevs

  abbrevs=( \
    '...'  '../..'
    '....'  '../../..'
    'tx'    'tar -xvzf'
  )

  # Create global aliases from the abbreviations.
  for abbr in ${(k)abbrevs}; do
  alias -g $abbr="${abbrevs[$abbr]}"
  done

  globalias() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbrevs[$MATCH]:-$MATCH}
    zle self-insert
  }

  zle -N globalias

  # List abbreviations and abbr binding, picks out help in green.
  H-Abbrevs() {
    echo "Displaying shell abbreviations"
    echo "Keybinding is:" ${$(bindabbr | grep globalias)[1]}
    for abbr in ${(ok)abbrevs}; do
      printf "%-20s: %s" $abbr ${abbrevs[$abbr]:s/
  /$fg[green] /} # Replaces newlines with spaces
      print -l $reset_color
    done
  }

  bindkey "  " globalias
  bindkey " " magic-space
}

__abbreviations

