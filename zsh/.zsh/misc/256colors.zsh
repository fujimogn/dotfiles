#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/misc/<t_co>colors.zsh
# $Date: 2011-11-01T19:25:20+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

function 256colors {
  for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 200
}
