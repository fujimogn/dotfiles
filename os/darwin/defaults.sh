#!/bin/sh

# Sets reasonable OS X defaults
#
# via https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#


# ------------------------------------------------------------------------------
# Global
# ------------------------------------------------------------------------------

# スペルチェック機能を無効にする
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# ウィンドウのタイトルバーをダブルクリックしてウィンドウをしまう
defaults write -g AppleMiniaturizeOnDoubleClick -bool true

# ------------------------------------------------------------------------------
# Finder
# ------------------------------------------------------------------------------


# リストビューで表示
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# パスバーを表示
defaults write com.apple.Finder ShowPathbar -int 1

# ステータスバーを非表示
defaults write com.apple.Finder ShowStatusBar -int 0

# ~/Library を表示
chflags nohidden ~/Library

# 以下を非表示
chflags hidden ~/bin
chflags hidden ~/opt
chflags hidden ~/lib
chflags hidden ~/node_modules
chflags hidden ~/git

# 拡張子を表示
defaults write -g AppleShowAllExtensions -int 1

# 拡張子を変更する前に警告を表示しない
defaults write com.apple.Finder FXEnableExtensionChangeWarning -int 0

# デスクトップ
# 外部ドライブを表示
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -int 1
# ハードディスクを表示
defaults write com.apple.Finder ShowHardDrivesOnDesktop -int 1
# リムーバルメディアを表示
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -int 1

# ネットワークで.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


