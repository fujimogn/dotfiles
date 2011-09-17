#!/usr/bin/sh
#
# $File: ${DOTDIR}/system/env
# $Date: 2011-09-17T11:20:02+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

export LANG=ja_JP.UTF-8
export TZ=JST-9

export GREP_OPTIONS='--color=always'
export GREP_COLOR='01;31'

if [[ $OSTYPE == darwin* ]]; then
  export CLICOLOR=1
fi
