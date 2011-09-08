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
#  %m = ホスト名の最初の `.' までの部分
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

# via https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/frisk.zsh-theme

if [[ x$WINDOW != x ]]
then
  SCREEN_NO="%B$WINDOW%b "
else
  SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

# Setup the prompt with pretty colors
setopt prompt_subst

PROMPT=$'
%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)%{$fg[white]%}[%n@%m]%{$reset_color%} %{$fg[white]%}[%T]%{$reset_color%}
%{$fg_bold[red]%}➜ %{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  SHA=$(git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Get the status of the working tree
git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
echo $STATUS
}


