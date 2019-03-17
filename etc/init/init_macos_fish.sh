#!/bin/bash

set -eu

echo 'install fisherman plugins'
fisher add < $DOTFILE/.config/fish/fishfile
source /usr/local/share/fish/vendor_completions.d # for docker
. ${DOTFILE}/.config/fish/config.fish

echo 'set pyenv settings'
pyenv install 3.7.2
pyenv global 3.7.2
pip3 install neovim

