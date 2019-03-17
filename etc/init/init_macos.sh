#!/bin/bash

set -eu

# echo 'install xcode'
# xcode-select --install
# sudo xcode-select --switch /Library/Developer/CommandLineTools

echo 'install homebrew'
if [ ! -e /usr/local/bin/brew ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
cat $DOTPATH/etc/init/brewfile | xargs brew install

echo 'change shell'
if ! $(sudo chsh -s /usr/local/bin/fish $USER); then 
    echo '/usr/local/bin/fish' >> /etc/shells
    chsh -s /usr/local/bin/fish $USER
fi

echo '******************************************'
echo 'Please execute following command in fish:'
echo "$ env DOTPATH=${DOTPATH} ${DOTPATH}/etc/init/init_macos_fish.sh"
echo '******************************************'

exec "$SHELL"

