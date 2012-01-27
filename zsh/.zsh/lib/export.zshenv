#!/usr/bin/sh
#
# $File: ${ZDOTDIR}/lib/export.zshenv
# $Date: 2012-01-27T11:23:47+0900$
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

## Mercurial
export HGENCODING=utf-8

## Rsense
if [ -d "/usr/lib/rsense" ]; then
  export RSENSE_HOME=/usr/lib/rsense
fi

## gisty
if which gisty > /dev/null 2>&1; then
  export GISTY_DIR=${HOME}/gist
  export GISTY_SSL_CA=`ruby -ropenssl -e 'p OpenSSL::X509::DEFAULT_CERT_FILE'`
  export GISTY_SSL_VERIFY="none"
fi

