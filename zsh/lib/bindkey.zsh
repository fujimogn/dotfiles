bindkey -e
bindkey '^u' backward-kill-line                     # Ctrl-u でカーソル位置から前方削除
bindkey "^h" backward-kill-word                     # Ctrl-h で単語ごとに削除
bindkey "^j" history-beginning-search-backward-end  # Ctrl-p で履歴を後方検索
bindkey "^k" history-beginning-search-forward-end   # Ctrl-n で履歴を前方検索
setopt ignore_eof                                   # Ctrl-d でログアウトしない
setopt no_flow_control                              # Ctrl-s,   Ctrl-qを無効にする
WORDCHARS='*?_-.[]~=&;!#$%^(){}'                    # Ctrl+w で直前の/までを削除する


