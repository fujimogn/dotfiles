#!/bin/sh

CURSRC=`basename $0`
CURDIR=`dirname $0`

if ( [ $# -eq 0 ] || [ "$1" = "install" ] ) && [ ! -x /usr/bin/mvim ]; then
  echo "Install ${CURSRC%.*}..."
  curl -L -o ${CURDIR}/mvim http://repo.or.cz/w/MacVim/KaoriYa.git/blob_plain/HEAD:/src/MacVim/mvim
  if [ $? -eq 0 ]; then
    sudo cp -v ${CURDIR}/mvim /usr/bin && sudo chmod +x /usr/bin/mvim && rm -f ${CURDIR}/mvim
  fi
elif [ "$1" = "clean" ]; then
  echo "Uninstall ${CURSRC%.*}..."
  sudo rm -fv /usr/bin/mvim
fi
