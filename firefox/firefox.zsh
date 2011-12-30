#!/usr/bin/zsh
#
# $File: ${DOTDIR}/todo.txt/todo.txt.zsh
# $Date: 2011-12-25T01:44:06+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# ostype prefix
case ${OSTYPE} in
  darwin*)
    dir=${HOME}/Library/Application\ Support/Firefox
    ;;
  linux*)
    dir=${HOME}/.mozilla/firefox
    ;;
esac

# set FIREFOX_PROF_PATH
if [ -d "${dir}" ] && [ -n "${dir}" ]; then
  prof_dir=`sed -n "s/Path=\(.*\)$/\1/p" "${dir}/profiles.ini"`
  if [ -n "${prof_dir}" ]; then
    export FIREFOX_PROF_PATH="${dir}/${prof_dir}"
  fi
  unset prof_dir
fi
unset dir

# vacuume & reindex func
firefox-vacuumdb() {
  if [ -n "${FIREFOX_PROF_PATH}" ]; then
    find "${FIREFOX_PROF_PATH}" -type f -name "*.sqlite" -print0 | \
      xargs -0 -I % sqlite3 % "vacuum;reindex"
  else
    return 1
  fi
}

