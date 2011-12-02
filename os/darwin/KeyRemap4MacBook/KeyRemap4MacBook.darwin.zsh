#!/usr/bin/zsh
#
# $File: ${DOTDIR}/KeyRemap4MacBook/KeyRemap4MacBook.zsh
# $Date: 2011-10-01T22:18:16+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:


CMD=/Library/org.pqrs/KeyRemap4MacBook/app/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli
[ ! -x "${CMD}" ] && return 1

alias kr4mb=${CMD}

# {{{ Setting

# while read line
# do
  # [[ $line = \#* ]] && continue
  # ${CMD} enable ${line}
# done<<EOF
# private.drop_escape
# private.control_bracket_to_escape
# private.shift_r_to_delete
# private.space_to_shiftL
# private.sticky_shiftL
# private.tarminal_escape_with_ime_off
# private.jis_commandL2commandL_toggle_kana_eisuu
# private.jis_commandL2commandR_toggle_kana_eisuu
# private.app_finder_return_to_command_o
# private.app_finder_command_R_to_return
# private.app_finder_f2_to_return
# save.vimode_finder
# private.vimode_finder_command_v_to_toggle
# private.vimode_finder_esc_to_off
# EOF

# }}}
# {{{ Display the list of identifier name on KeyRemap4MacBook

function kr4mb-list-private {
  target=${HOME}/Library/Application\ Support/KeyRemap4MacBook/private.xml
  [ ! -e "${target}" ] && return 1
  grep '<identifier.*</identifier>' "${target}" | sed -e 's/.*<identifier[^>]*>//g' | sed -e 's/<\/identifier>//g'
  unset target
}

function kr4mb-list-checkbox {
  target=/Library/org.pqrs/KeyRemap4MacBook/prefpane/checkbox.xml
  [ ! -e "${target}" ] && return 1
  grep '<identifier.*</identifier>' "${target}" | sed -e 's/.*<identifier[^>]*>//g' | sed -e 's/<\/identifier>//g'
  unset target
}

function kr4mb-list-number {
  target=/Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml
  [ ! -e "${target}" ] && return 1
  grep '<identifier.*</identifier>' "${target}" | sed -e 's/.*<identifier[^>]*>//g' | sed -e 's/<\/identifier>//g'
  unset target
}

# }}}

unset CMD line
