#!/usr/bin/env bash

#
# Setup a minimal bash prompt.
#
# Usage: set_prompt [symbol]
#
# $1 = Character to use as prompt symbol (default: $).
#
set_prompt() {
  local symbol=${1:-\$}

  # ANSI colors
  # local black="\e[1;30m"
  # local red="\e[1;31m"
  # local green="\e[1;32m"
  # local yellow="\e[1;33m"
  # local orange="\e[1;33m"
  # local cyan="\e[1;36m"
  # local white="\e[1;37m"
  local blue="\e[1;34m"
  local purple="\e[1;35m"
  local reset="\e[0m"

  # Set terminal title to current working directory
  PS1="\[\033]0;\w\007\]"

  # Customize the bash prompt
  PS1+="\n\[$blue\]\w\[$reset\]\n"
  PS1+="\[$purple\]$symbol \[$reset\]"

  # Export the changes made to the prompt
  export PS1
}

set_prompt "$@"
