#!/bin/zsh

export RUBYLIB=.:$RUBYLIB

alias r='bundle exec rake'
alias sp='bundle exec rake spec'

# rbenv# {{{
if which rbenv >/dev/null 2>&1 ; then
  eval "$(rbenv init -)"
  gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
fi

# }}}
# bundle exec を省略する# {{{
# http://d.hatena.ne.jp/willnet/20110612/1307849053

BUNDLED_COMMANDS=(
cap
capify
cucumber
foreman
guard
haml
heroku
html2haml
jekyll
pry
rackup
rails
rake
rake2thor
rspec
ruby
sass
sass-convert
serve
shotgun
spec
spork
thin
thor
tilt
tt
unicorn
unicorn_rails)

bundler-installed()
{
    which bundle > /dev/null 2>&1
}

within-bundled-project()
{
    local dir="$(pwd)"
    while [ "$(dirname $dir)" != "/" ]; do
        [ -f "$dir/Gemfile" ] && return
        dir="$(dirname $dir)"
    done
    false
}

run-with-bundler()
{
    local command="$1"
    shift
    if bundler-installed && within-bundled-project; then
        bundle exec $command "$@"
    else
        $command "$@"
    fi
}

for CMD in $BUNDLED_COMMANDS; do
    alias $CMD="run-with-bundler $CMD"
done
# }}}
# rake completion# {{{
_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -c %Y .rake_tasks)
    changed=$(stat -c %Y Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd `cat .rake_tasks`
  fi
}
compdef _rake rake
# }}}
# RSense# {{{
# http://cx4a.org/software/rsense/

if [ -d "/usr/lib/rsense" ]; then
  export RSENSE_HOME=/usr/lib/rsense
fi

# }}}
