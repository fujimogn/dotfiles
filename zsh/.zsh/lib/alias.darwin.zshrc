#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/alias.zshrc
# $Date: 2011-11-04T16:07:59+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
alias rmdsstore="find . -name '*.DS_Store' -type f -delete"


# mongodb
alias mongo-stop launchctl unload -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
alias mongo-start launchctl load ~/Library/LaunchAgents/org.mongodb.mongod.plist


function __firefox_profile() {
  local profile firefox_dir="${HOME}/Library/Application Support/Firefox"
  if [ -d "${firefox_dir}" ]; then
    profile=`sed -n "s/Path=\(.*\)$/\1/p" "${firefox_dir}/profiles.ini"`
    echo "${firefox_dir}/${profile}"
  fi
}

# alias firefox_profile='"`__firefox_profile`"'
