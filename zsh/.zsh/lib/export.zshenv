#!/usr/bin/sh
#
# $File: ${DOTDIR}/system/env
# $Date: 2011-11-06T13:13:02+0900$
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
    linux);>LC_ALL=C
esac


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

# Firefox
APPS=${HOME}/Library/Application\ Support
if [ -d "${APPS}/Firefox" ]; then
  PROF=`sed -n "s/Path=\(.*\)$/\1/p" "${APPS}/Firefox/profiles.ini"`
  export FIREFOX_PROF_PATH="${APPS}/Firefox/${PROF}"
  unset PROF
fi
unset APPS

