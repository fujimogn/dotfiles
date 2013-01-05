#!/bin/zsh

export RUBYLIB=.:$RUBYLIB
export RSPEC=true

alias rake="noglob rake"
alias 3k="open http://localhost:3000"

# rbenv# {{{
if [ -d /usr/local/opt/rbenv ]; then
  export RBENV_ROOT=/usr/local/opt/rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

# }}}
# bundle exec を省略する# {{{
# http://d.hatena.ne.jp/willnet/20110612/1307849053

BUNDLED_COMMANDS=(
af
cap
capify
cucumber
compass
foreman
guard
haml
html2haml
jekyll
pry
padrino
powder
rackup
rails
rake
rake2thor
rawler
rspec
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
unicorn_rails
wordless)

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
# Alias {{{

alias r="rake"
alias rs="rake spec"


# }}}
# rake completion# {{{

_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks)
    changed=$(stat -f%m Rakefile)
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
