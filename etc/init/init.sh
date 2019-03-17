#!/bin/bash

trap 'echo Error: $0: stopped; exit 1' ERR INT
set -eu

if [ -z "$DOTPATH" ]; then
    echo '$DOTPATH not set' >&2
    exit 1
fi

. $DOTPATH/etc/lib/vital.sh
. $DOTPATH/etc/lib/standard.sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
while true
do
    sudo -n true
    sleep 60;
    kill -0 "$$" || exit
done 2>/dev/null &

# main
if [ `${DOTPATH}/bin/get_os` = "macOS" ]; then
    . $DOTPATH/etc/init/init_macos.sh
else
    echo 'Not found init settings corresponded current OS'
fi

echo $(e_success "$0: Finish!!")
