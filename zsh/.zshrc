#!/usr/bin/zsh
#
# $File: .zsh/.zshrc
# $Date: 2011-09-07T21:18:53+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

# history
HISTFILE=${ZDOTDIR}/.zsh_history
HISTIGNORE='?:??:rm *:\\rm *:r\\m *'
HISTSIZE=10000
SAVEHIST=10000
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
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
# setopt
setopt auto_cd                  # ディレクトリ名だけで移動
setopt auto_name_dirs           # "~$var" でディレクトリにアクセス
setopt auto_pushd               # 移動したディレクトリを記録しておく
setopt brace_ccl                # {a-za-z} をブレース展開
setopt cdable_vars              # 先頭に "~" を付けたもので展開
setopt chase_links              # シンボリックリンクはリンク先のパスに変換してから実行
setopt interactive_comments     # コマンドラインで # 以降をコメントとする
setopt multios                  # 複数のリダイレクトやパイプに対応
setopt no_beep                  # ビープ音を出さない
setopt no_clobber               # リダイレクトで上書きを禁止
setopt nolistbeep               # リスト補完の時ビープ音を出さない
setopt nonomatch                # ファイル名置換がマッチしない場合エラーにしない
setopt notify                   # バックグラウンドジョブが終了したすぐに知らせる
setopt numeric_glob_sort        # 数値順でソート
setopt print_eight_bit          # 日本語を正しく表示する
setopt prompt_subst             # プロンプト内で変数展開
setopt pushd_ignore_dups        # pushdの履歴は残さない
setopt pushd_silent             # pushdやpopdの実行時にメッセージを表示しないようにする
setopt pushd_to_home            # 引数のないpushdは$HOMEをスタックする
# setopt print_exit_value         # 戻り値が 0 以外の場合終了コードを表示
# setopt rm_star_silent           # rm * を実行する前に確認しない
setopt rm_star_wait             # rm * を実行する前に確認
setopt sh_word_split            # 変数内の文字列分解のデリミタ
setopt sun_keyboard_hack        # 末尾の ` を無視
unsetopt flow_control           # C-s, C-q を無効にする
unsetopt promptcr               # 改行コードで終らない出力もちゃんと出力する
# completion
setopt always_last_prompt       # 補完してもプロンプトの位置を変えない。デフォルトで有効
setopt always_to_end            # 補完時に文字列末尾へカーソル移動
setopt auto_list                # 補完候補が複数あるとき自動でメニューをリストアップ。デフォルトで有効
setopt auto_menu                # 補完要求に対してメニューをリストアップ。デフォルトで有効
setopt auto_param_keys          # カッコの対応などを自動的に補完。デフォルトで有効
setopt auto_param_slash         # ディレクトリ名の補完で末尾の / を自動的に付加。デフォルトで有効
setopt auto_remove_slash        # 無駄な末尾の / を削除する。デフォルトで有効
# setopt complete_aliases         # 補完実行時にエイリアスを展開せずにそのままのコマンドとしてエイリアスを扱う
setopt complete_in_word         # 語の途中でもカーソル位置で補完
setopt extended_glob            # ファイル名で #,  ~,  ^ の 3 文字を正規表現として扱う
setopt hash_list_all            # 最初のコマンド補完実行時にコマンドパスをハッシュする。デフォルトで有効
setopt list_packed              # 補完候補を詰めて表示する
setopt list_types               # 補完候補で ls -F。デフォルトで有効
# setopt list_rows_first        # 補完の表示を水平方向に
# setopt menu_complete          # 補完候補リストを表示せずにメニュー補完
setopt magic_equal_subst        # = 以降でも補完できるようにする
setopt rec_exact                # 曖昧さがあっても正確なマッチ
unsetopt list_beep              # 曖昧な補完にビープ音を鳴らさない

