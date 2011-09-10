#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/lib/color.zshrc
# $Date: 2011-09-10T14:18:50+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# color

autoload colors zsh/terminfo

None="%{$terminfo[sgr0]%}"
if (( terminfo[colors] >= 16 )); then
    Black="%{$(tput setaf 0)%}"
    DarkGray="%{$(tput setaf 8)%}"
    LightGray="%{$(tput setaf 7)%}"
    White="%{$(tput setaf 15)%}"
    Red="%{$(tput setaf 9)%}"
    DarkRed="%{$(tput setaf 1)%}"
    Green="%{$(tput setaf 10)%}"
    DarkGreen="%{$(tput setaf 2)%}"
    Yellow="%{$(tput setaf 11)%}"
    DarkYellow="%{$(tput setaf 3)%}"
    Blue="%{$(tput setaf 12)%}"
    DarkBlue="%{$(tput setaf 4)%}"
    Magenta="%{$(tput setaf 13)%}"
    DarkMagenta="%{$(tput setaf 5)%}"
    Cyan="%{$(tput setaf 14)%}"
    DarkCyan="%{$(tput setaf 6)%}"
    BlackBg="%{$(tput setab 0)%}"
    DarkGrayBg="%{$(tput setab 8)%}"
    LightGrayBg="%{$(tput setab 7)%}"
    WhiteBg="%{$(tput setab 15)%}"
    RedBg="%{$(tput setab 9)%}"
    DarkRedBg="%{$(tput setab 1)%}"
    GreenBg="%{$(tput setab 10)%}"
    DarkGreenBg="%{$(tput setab 2)%}"
    YellowBg="%{$(tput setab 11)%}"
    DarkYellowBg="%{$(tput setab 3)%}"
    BlueBg="%{$(tput setab 12)%}"
    DarkBlueBg="%{$(tput setab 4)%}"
    MagentaBg="%{$(tput setab 13)%}"
    DarkMagentaBg="%{$(tput setab 5)%}"
    CyanBg="%{$(tput setab 14)%}"
    DarkCyanBg="%{$(tput setab 6)%}"
elif (( terminfo[colors] == 8)); then
    Black="%{$(tput setaf 0)%}"
    DarkGray="%{$(tput setaf 0;tput bold)%}"
    LightGray="%{$(tput setaf 7)%}"
    White="%{$(tput setaf 7;tput bold)%}"
    Red="%{$(tput setaf 1;tput bold)%}"
    DarkRed="%{$(tput setaf 1)%}"
    Green="%{$(tput setaf 2;tput bold)%}"
    DarkGreen="%{$(tput setaf 2)%}"
    Yellow="%{$(tput setaf 3;tput bold)%}"
    DarkYellow="%{$(tput setaf 3)%}"
    Blue="%{$(tput setaf 4;tput bold)%}"
    DarkBlue="%{$(tput setaf 4)%}"
    Magenta="%{$(tput setaf 5;tput bold)%}"
    DarkMagenta="%{$(tput setaf 5)%}"
    Cyan="%{$(tput setaf 6;tput bold)%}"
    DarkCyan="%{$(tput setaf 6)%}"
    BlackBg="%{$(tput setab 0)%}"
    DarkGrayBg="%{$(tput setab 0;tput blink)%}"
    LightGrayBg="%{$(tput setab 7)%}"
    WhiteBg="%{$(tput setab 7;tput blink)%}"
    RedBg="%{$(tput setab 1;tput blink)%}"
    DarkRedBg="%{$(tput setab 1)%}"
    GreenBg="%{$(tput setab 2;tput blink)%}"
    DarkGreenBg="%{$(tput setab 2)%}"
    YellowBg="%{$(tput setab 3;tput blink)%}"
    DarkYellowBg="%{$(tput setab 3)%}"
    BlueBg="%{$(tput setab 4;tput blink)%}"
    DarkBlueBg="%{$(tput setab 4)%}"
    MagentaBg="%{$(tput setab 5;tput blink)%}"
    DarkMagentaBg="%{$(tput setab 5)%}"
    CyanBg="%{$(tput setab 6;tput blink)%}"
    DarkCyanBg="%{$(tput setab 6)%}"
else
    Black=""
    DarkGray=""
    LightGray=""
    White=""
    Red=""
    DarkRed=""
    Green=""
    DarkGreen=""
    Yellow=""
    DarkYellow=""
    Blue=""
    DarkBlue=""
    Magenta=""
    DarkMagenta=""
    Cyan=""
    DarkCyan=""
    BlackBg=""
    DarkGrayBg=""
    LightGrayBg=""
    WhiteBg=""
    RedBg=""
    DarkRedBg=""
    GreenBg=""
    DarkGreenBg=""
    YellowBg=""
    DarkYellowBg=""
    BlueBg=""
    DarkBlueBg=""
    MagentaBg=""
    DarkMagentaBg=""
    CyanBg=""
    DarkCyanBg=""
    None=""
fi

if [[ ${TERM} != "dumb" ]]; then
    case ${OSTYPE} in
      darwin*)
        alias ls="ls -FG"
        ;;
      *)
        alias ls="ls -F --color=auto"
      ;;
    esac

    if which gdircolors > /dev/null 2>&1; then
      alias dircolors=gdircolors
    fi

    if  which dircolors > /dev/null 2>&1 ; then
      if [ -f ${DOTDIR}"/dircolors/.dircolors-"$terminfo[colors] ]; then
        echo "256"
        eval $(dircolors -b ${DOTDIR}/dircolors/.dircolors-$terminfo[colors])
      elif [ -f ${DOTDIR}/dircolors/.dircolors ]; then
        eval $(dircolors -b ${DOTDIR}/dircolors/.dircolors)
      fi
      zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    fi
fi
