#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/export.zshenv
# $Date: 2012-02-25T11:17:25+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# Lang
export LANG=ja_JP.UTF-8

# Timezone
export TZ=JST-9

# PAGER
if type lv > /dev/null 2>&1; then
    export PAGER="lv"
else
    export PAGER="less"
fi
if [ "$PAGER" = "lv" ]; then
  export LV="-c -l"
else
  alias lv="$PAGER"
fi

## Mercurial
export HGENCODING=utf-8


