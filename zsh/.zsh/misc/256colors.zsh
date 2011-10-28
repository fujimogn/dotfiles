#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/misc/<t_co>colors.zsh
# $Date: 2011-10-29T04:24:01+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

function <t_co>colors() {
for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 200
}}
