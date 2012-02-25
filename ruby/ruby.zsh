#!/bin/zsh

## rbenv
if which rbenv >/dev/null 2>&1 ; then
  eval "$(rbenv init -)"
  gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
fi

export RUBYLIB=.:$RUBYLIB

## Rsense
if [ -d "/usr/lib/rsense" ]; then
  export RSENSE_HOME=/usr/lib/rsense
fi

