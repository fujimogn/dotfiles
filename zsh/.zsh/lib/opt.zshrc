#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/opt.zshrc
# $Date: 2012-08-10T04:55:19+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# {{{ basic

setopt auto_cd                  # ディレクトリ名だけで移動
# setopt auto_name_dirs           # "~$var" でディレクトリにアクセス
# setopt auto_pushd               # 移動したディレクトリを記録しておく
setopt brace_ccl                # {a-za-z} をブレース展開
# setopt cdable_vars              # 先頭に "~" を付けたもので展開
# setopt chase_links              # シンボリックリンクはリンク先のパスに変換してから実行
setopt interactive_comments     # コマンドラインで # 以降をコメントとする
setopt multios                  # 複数のリダイレクトやパイプに対応
setopt no_beep                  # ビープ音を出さない
setopt no_clobber               # リダイレクトで上書きを禁止
setopt nolistbeep               # リスト補完の時ビープ音を出さない
setopt nonomatch                # ファイル名置換がマッチしない場合エラーにしない
setopt notify                   # バックグラウンドジョブが終了したすぐに知らせる
setopt numeric_glob_sort        # 数値順でソート
setopt print_eight_bit          # 日本語を正しく表示する
setopt pushd_ignore_dups        # pushdの履歴は残さない
setopt pushd_silent             # pushdやpopdの実行時にメッセージを表示しないようにする
# setopt pushd_to_home            # 引数のないpushdは$HOMEをスタックする
setopt print_exit_value         # 戻り値が 0 以外の場合終了コードを表示
# setopt rm_star_wait             # rm * を実行する前に確認
setopt sh_word_split            # 変数内の文字列分解のデリミタ
setopt sun_keyboard_hack        # 末尾の ` を無視
setopt no_flow_control          # C-s, C-q を無効にする
setopt ignore_eof               # C-dでexitしない

# }}}
