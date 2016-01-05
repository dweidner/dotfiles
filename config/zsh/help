#!/usr/bin/env zsh

if [[ $(whence -v run-help) == 'run-help is a shell function' ]]; then
  unalias run-help
fi

# Enable run-help module used to extract descriptions of builtin commands
autoload -Uz run-help
alias help='run-help'
