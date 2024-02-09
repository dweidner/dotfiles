# shell/path.sh
#
# @file Customizes the list of directories used when search for commands
#
# ----------------------------------------------------------------------
# Table of Contents
# ----------------------------------------------------------------------
# 1. Utility Functions
# 2. Path Directories
# ----------------------------------------------------------------------


# (1) Utility Functions ------------------------------------------------ {{{1

#
# Print each directory of the PATH variable on a separate line.
#
# usage: path [<path>]
#
dot::path() {
  echo "${1:-$PATH}:" | while read -rd: dir; do
    echo "${dir}"
  done
}

#
# Determine whether a given directory is already added to the PATH.
#
# usage: path_contains <directory>
#
dot::path_contains() {
  [[ ":${PATH}:" = *":${1}:"* ]]
}

#
# Add a new directory to the path if it is not already added.
#
# usage: path_add <directory>
#
dot::path_add() {
  [[ -d "${1}" ]] || return

  if ! dot::path_contains "${1}"; then
    PATH="${1}:${PATH}"
  fi
}


# (2) Path Directories ------------------------------------------------- {{{1

dot::path_add "/usr/local/sbin"
dot::path_add "/usr/local/bin"

dot::path_add "/opt/homebrew/sbin"
dot::path_add "/opt/homebrew/bin"

dot::path_add "${HOME}/.docker/bin"
dot::path_add "${HOME}/.local/bin"

dot::path_add "${DOTFILES}/bin"

export PATH

