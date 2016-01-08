#!/usr/bin/env bash

#
# Print colored header information.
#
# Usage: e_header msg
#
# $1 = Message to print
#
e_header() {
  printf "$(tput bold)$(tput setaf 7)%s$(tput sgr0)\n" "$*"
}

#
# Print colored success message.
#
# Usage: e_header msg
#
# $1 = Message to print
#
e_success() {
  printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$*"
}

#
# Print colored warning.
#
# Usage: e_warning msg
#
# $1 = Message to print
#
e_warning() {
  printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$*"
}

#
# Print colored error message.
#
# Usage: e_error msg
#
# $1 = Message to print
#
e_error() {
  printf "$(tput setaf 1)x %s$(tput sgr0)\n" "$*"
}

#
# Ask user for confirmation before proceeding.
#
# Usage: seek_confirmation question
#
# $1 = Question to ask
#
seek_confirmation() {
  read -r -n 1 -p "$(tput setaf 136)? $* (y/n) $(tput sgr0)"; printf "\n"
}

#
# Test whether the user has confirmed the last question.
#
is_confirmed() {
  [[ "$REPLY" =~ ^[YyJj]$ ]]
}
