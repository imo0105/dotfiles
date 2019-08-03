# config path
set -x XDG_CONFIG_HOME $HOME/.config

# gopath
set -x GOPATH $HOME/go

## goenv 
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH 
goenv init - | source

# user path
set -x PATH $PATH $HOME/bin

