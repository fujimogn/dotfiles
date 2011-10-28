#!/usr/bin/sh
#
# $File: ${DOTDIR}/system/env
# $Date: 2011-10-29T03:03:23+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

# Lang
export LANG=ja_JP.UTF-8

# Timezone
export TZ=JST-9

# Terminal
export COLORTERM=0
case "$TERM" in
    xterm*);
      COLORTERM=1
      ;;
    mlterm*);
      COLORTERM=1
      TERM='kterm-color'
      ;;
    screen*);
      COLORTERM=1
      SCREEN=1
      TERM='xterm-256color'
      ;;
    ct100*);
      COLORTERM=1
      ;;
    kterm*);
      COLORTERM=1
      TERM='kterm-color'
      export LANG=ja_JP.eucJP;   #w3m とか mutt とかに必要
      export LC_ALL=ja_JP.eucJP;;
    #vim は TERM='kterm' ではカラー化しない
    #screen は TERM='kterm-color' ではタイトルバーに情報表示できない
    linux);>LC_ALL=C
esac

# export GREP_OPTIONS='--color=always --binary-files=without-match'

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

# polipo
if [ -x /usr/local/bin/polipo ]; then
  export http_proxy=http://127.0.0.1:8123/
  export ALL_PROXY=$http_proxy
fi
