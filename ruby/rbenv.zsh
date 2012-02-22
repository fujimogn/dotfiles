#!/bin/zsh

# rbenv
if which rbenv >/dev/null 2>&1 ; then
  eval "$(rbenv init -)"
fi

gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
