#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/history.zshrc
# $Date: 2012-02-27T08:23:56+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


HISTFILE=${HOME}/.tmp/.zsh_history

HISTIGNORE='?:??:rm *:\\rm *:r\\m *'
HISTSIZE=100000
SAVEHIST=100000

if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

setopt append_history           # 履歴を追加
setopt extended_history         # ヒストリファイルに開始/終了タイムスタンプを書き込み
setopt hist_expand              # 補完時にヒストリを自動的に展開
setopt hist_expire_dups_first   # 古い履歴を削除する必要がある場合、まず重複しているものから削除する
setopt hist_ignore_all_dups     # 重複するコマンド行は古い方を削除する
setopt hist_ignore_dups         # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_space        # 先頭が空白だった場合はログに記述しない
setopt hist_reduce_blanks       # 余分な空白は詰めて記録
setopt hist_no_store            # history コマンドは履歴に登録しない
setopt hist_no_functions        # 関数定義を履歴に保存しない
setopt hist_save_no_dups        # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する
setopt hist_verify              # ヒストリを呼び出してから編集可能な状態にする
setopt inc_append_history       # 履歴をインクリメンタルに追加
setopt share_history            # ヒストリを複数端末で共有する

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
