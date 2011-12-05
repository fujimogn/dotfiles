#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/bindkey.zshrc
# $Date: 2011-12-05T21:53:12+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

bindkey -e
bindkey '^U' backward-kill-line                     # Ctrl-u でカーソル位置から前方削除
bindkey "^H" backward-kill-word                     # Ctrl-h で単語ごとに削除
bindkey "^P" history-beginning-search-backward-end  # Ctrl-p で履歴を後方検索
bindkey "^N" history-beginning-search-forward-end   # Ctrl-n で履歴を前方検索
bindkey "^I" menu-complete                          # Ctrl-i で補完するようにする
setopt ignore_eof                                   # Ctrl-d でログアウトしない
setopt no_flow_control                              # Ctrl-s,   Ctrl-qを無効にする
WORDCHARS='*?_-.[]~=&;!#$%^(){}'                    # Ctrl+w で直前の/までを削除する

