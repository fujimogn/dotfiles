#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/plugin/cleanmemory.darwin.zsh
# $Date: 2011-09-16T08:31:51+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# via http://d.hatena.ne.jp/zariganitosh/20110617/free_memory

function cleanmemory(){
  purge
  diskutil repairpermissions /
  du -sx / >& /dev/null & sleep 5 && kill $!
}
