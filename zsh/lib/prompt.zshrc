#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/prompt.zshrc
# $Date: 2011-09-11T08:19:54+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via http://www.dna.bio.keio.ac.jp/~yuji/zsh/zshrc.txt
# <エスケープシーケンス>
# prompt_bang が有効な場合、!=現在の履歴イベント番号, !!='!' (リテラル)
# ${WINDOW:+"[$WINDOW]"} = screen 実行時にスクリーン番号を表示 (prompt_subst が必要)
# %B = underline
# %/ or %d = ディレクトリ (0=全て, -1=前方からの数)
# %~ = ディレクトリ
# %h or %! = 現在の履歴イベント番号
# %L = 現在の $SHLVL の値
# %M = マシンのフルホスト名
# %m = ホスト名の最初の `.' までの部分
# %S (%s) = 突出モードの開始 (終了)
# %U (%u) = 下線モードの開始 (終了)
# %B (%b) = 太字モードの開始 (終了)
# %t or %@ = 12 時間制, am/pm 形式での現在時刻
# %n or $USERNAME = ユーザー ($USERNAME は環境変数なので setopt prompt_subst が必要)
# %N = シェル名
# %i = %N によって与えられるスクリプト, ソース, シェル関数で, 現在実行されている行の番号 (debug用)
# %T = 24 時間制での現在時刻
# %* = 24 時間制での現在時刻, 秒付き
# %w = `曜日-日' の形式での日付
# %W = `月/日/年' の形式での日付
# %D = `年-月-日' の形式での日付
# %D{string} = strftime 関数を用いて整形された文字列 (man 3 strftime でフォーマット指定が分かる)
# %l = ユーザがログインしている端末から, /dev/ プレフィックスを取り除いたもの
# %y = ユーザがログインしている端末から, /dev/ プレフィックスを取り除いたもの (/dev/tty* はソノママ)
# %? = プロンプトの直前に実行されたコマンドのリターンコード
# %_ = パーサの状態
# %E = 行末までクリア
# %# = 特権付きでシェルが実行されているならば `#', そうでないならば `%' == %(!.#.%%)
# %v = psvar 配列パラメータの最初の要素の値
# %{...%} = リテラルのエスケープシーケンスとして文字列をインクルード
# %(x.true-text.false-text) = 三つ組の式
# %<string<, %>string>, %[xstring] = プロンプトの残りの部分に対する, 切り詰めの振る舞い
#         `<' の形式は文字列の左側を切り詰め, `>' の形式は文字列の右側を切り詰めます
# %c, %., %C = $PWD の後ろ側の構成要素

Text=${DarkGray}

PS1="
"${Text}'['${Blue}'%?'${Text}']--['${Cyan}'%*'${Text}']--['${Green}'%n'${Text}'@'${Magenta}'%m'${Text}']--['${Red}'%~'${Text}${Yellow}'$(___git_ps1)'${Text}']'${Text}"
"${DarkRed}'➜  '${None}

function precmd {
  case ${TERM} in
    xterm*|gnome*|konsole*|putty*|screen*)
      print -Pn "\e]0;%n@%m: %~\a"
      ;;
  esac

  if [[ ${TERM} == screen* && ( -n "${TMUX}" || -n "${STY}" ) ]]; then
    print -n "\a"
  fi
  if [[ ${TERM} == screen* ]]; then
    print -Pn "\ek\e\\"
  fi
}

function preexec {
}


function ___git_ps1 () {
  local g p
  g=$(git rev-parse --git-dir 2>/dev/null) || return
  if [[ ${g} == ".git" ]]; then
    __git_ps1 " %s"
  elif [[ ${g} == ${HOME}"/.git" ]]; then
    if [[ -f ".gitignore" ]]; then
      __git_ps1 " %s"
    else
      p=$(git rev-parse --show-prefix 2>/dev/null)
      case ${p} in
        .dotfiles/*|.vim/*)
          __git_ps1 " %s"
          ;;
      esac
    fi
  else
    __git_ps1 " %s"
  fi
}

function __git_ps1 () {
  local git_dir action branch

  git_dir=$(git rev-parse --git-dir 2>/dev/null) || return
  if [[ -d "$git_dir/rebase-apply" ]]; then
    if [[ -f "$git_dir/rebase-apply/rebasing" ]]; then
      action="|REBASE"
    elif [[ -f "$git_dir/rebase-apply/applying" ]]; then
      action="|AM"
    else
      action="|AM/REBASE"
    fi
    branch="$(git symbolic-ref HEAD 2>/dev/null)"
  elif [[ -f "$git_dir/rebase-merge/interactive" ]]; then
    action="|REBASE-i"
    branch="$(cat "$git_dir/rebase-merge/head-name")"
  elif [[ -d "$git_dir/rebase-merge" ]]; then
    action="|REBASE-m"
    branch="$(cat "$git_dir/rebase-merge/head-name")"
  elif [[ -f "$git_dir/MERGE_HEAD" ]]; then
    action="|MERGING"
    branch="$(git symbolic-ref HEAD 2>/dev/null)"
  else
    [[ -f "$git_dir/BISECT_LOG" ]] && action="|BISECTING"
    branch="$(git symbolic-ref HEAD 2>/dev/null)" || \
      branch="$(git describe --exact-match HEAD 2>/dev/null)" || \
      branch="$(cut -c1-7 "$git_dir/HEAD")..."
  fi

  git_dir="${$(readlink -f ${git_dir:h})/$HOME/~}"
  branch=${branch#refs/heads/}
  if [[ -n $1 ]]; then
    printf "$1" "${branch}${action}"
  else
    printf " (%s)" "${branch}${action}"
  fi
}


