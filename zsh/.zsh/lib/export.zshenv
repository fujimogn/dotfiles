#!/usr/bin/sh
#
# $File: ${DOTDIR}/system/env
# $Date: 2011-10-23T00:32:14+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

export LANG=ja_JP.UTF-8
export TZ=JST-9

if [[ $OSTYPE == darwin* ]]; then
  export CLICOLOR=1
fi

# export GREP_OPTIONS='--color=always --binary-files=without-match'

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

if [ -x /usr/local/bin/polipo ]; then
  export http_proxy=http://127.0.0.1:8123/
  export ALL_PROXY=$http_proxy
fi
