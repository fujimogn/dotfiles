#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/color.zshrc
# $Date: 2011-09-09T22:43:46+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# color
# via http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

autoload -U colors; colors

local GRAY=$'%{\e[1;30m%}'         # 灰色
local RED=$'%{\e[1;31m%}'          # 赤色
local GREEN=$'%{\e[1;32m%}'        # 緑色
local YELLOW=$'%{\e[1;33m%}'       # 黄色
local BLUE=$'%{\e[1;34m%}'         # 青色
local PURPLE=$'%{\e[1;35m%}'       # 紫色
local LIGHT_BLUE=$'%{\e[1;36m%}'   # 水色
local WHITE=$'%{\e[1;37m%}'        # 白色
local DEFAULT=$white               # 標準

typeset -Ag FX FG BG

FX=(
  reset       "%{ [00m%}"
  bold        "%{ [01m%}"   no-bold       "%{ [22m%}"
  italic      "%{ [03m%}"   no-italic     "%{ [23m%}"
  undeerline  "%{ [04m%}"   no-underline  "%{ [24m%}"
  blink       "%{ [05m%}"   no-blink      "%{ [25m%}"
  reverse     "%{ [07m%}"   noreverse     "%{ [27m%}"
)

for color in {000..255}; do
  FG[$color]="%{ [38;5;${color}m%}"
  BG[$color]="%{ [38;5;${color}m%}"
done

function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f"
  done
}

if which dircolors >/dev/null 2>&1; then
  eval `dircolors`
else
  export LSCOLORS="Gxfxcxdxbxegedabagacad"
  # export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
fi

# ls を色付
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# kill を色付
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


