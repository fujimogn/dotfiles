#!/bin/zsh

# ダウンロードフォルダ
export DOWNLOAD_DIR=${DOWNLOAD_DIR:-${HOME}/Downloads}

# # 新しくつくる
DOWNLOAD_DIR_MKDIR=${DOWNLOAD_DIR}/`date +"%Y-%m-%d"`

# 指定ディレクトリ下すべてのファイル文字化けを直す
function nkf-recursive {

  [ ! -d "${1}" ] || [ `find ${1} | wc -l` = 0 ] && return 1

  for fname in ${1}/*
  do
    newname=`echo ${fname}|nkf --url-input -w`
    if [ "${fname}" != "${newname}" ]; then
      mv -f "${fname}" "${newname}"
      fname=${newname}
    fi
    if [ -d "${fname}" ]; then
      nkf-recursive ${fname}
    fi
  done
}

function wget-apachedir {

  [ -z "${1}" ] && return 1

  local opt=
  # 出力の冗長無効
  # opt+=' -nv'
  # サーバの応答を表示する
  opt+=' -S'
  # robot.txtを無視
  opt+=' -e robots=off'
  # 再帰的に
  opt+=' -r'
  # 親ディレクトリを取得対象にしない
  opt+=' -np'
  # 相対リンクだけ取得対象にする
  opt+=' -L'
  # 無視するタグ(カンマ区切りで指定)
  # icon画像は無視
  opt+=' --ignore-tags=img'
  # ダウンロードしない拡張子(カンマ区切りで指定)
  opt+=' -R *index.html*'
  # OSで許可されているファイル名にする
  opt+=' --restrict-file-names=nocontrol'

  # ダウンロードフォルダ
  if [ -n "${DOWNLOAD_DIR_MKDIR}" ] && [ -w "${DOWNLOAD_DIR}" ]; then
    [ ! -d "${DOWNLOAD_DIR_MKDIR}" ] && mkdir -p ${DOWNLOAD_DIR_MKDIR}
    local dir=${DOWNLOAD_DIR_MKDIR}
  elif [ -n "${DOWNLOAD_DIR}" ] && [ -w "${DOWNLOAD_DIR}" ]; then
    local dir=${DOWNLOAD_DIR}
  fi

  if [ -n "${dir}" ]; then
    opt+=" -P ${dir}"
  fi

  wget ${opt} $@ && nkf-recursive ${DOWNLOAD_DIR_MKDIR}

}

