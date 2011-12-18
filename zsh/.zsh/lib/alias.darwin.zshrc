#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/alias.darwin.zshrc
# $Date: 2011-12-12T17:48:08+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
alias rmdsstore="find . -name '*.DS_Store' -type f -delete"


# mongodb
alias mongo-stop="launchctl unload ~/Library/LaunchAgents/org.mongodb.mongod.plist"
alias mongo-start="launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist"

