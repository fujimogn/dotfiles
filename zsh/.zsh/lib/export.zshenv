#!/usr/bin/sh
#
# $File: ${DOTDIR}/system/env
# $Date: 2011-12-06T22:39:02+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

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

# Firefox
APPS=${HOME}/Library/Application\ Support
if [ -d "${APPS}/Firefox" ]; then
  PROF=`sed -n "s/Path=\(.*\)$/\1/p" "${APPS}/Firefox/profiles.ini"`
  export FIREFOX_PROF_PATH="${APPS}/Firefox/${PROF}"
  unset PROF
fi
unset APPS

