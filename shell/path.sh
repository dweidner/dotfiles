# shell/path.sh
#
# @file Customizes the list of directories used when search for commands
#
# ----------------------------------------------------------------------
# Table of Contents
# ----------------------------------------------------------------------
# 1. Utility Functions
# 2. Local Binaries
# 3. Package Managers
# 4. User Trumps
# 5. User Manuals
# ----------------------------------------------------------------------


# (1) Utility Functions ------------------------------------------------ {{{1

#
# Print each directory of the PATH variable on a separate line.
#
# usage: path [<path>]
#
path() {
  echo "${1:-$PATH}" | while read -rd: dir; do
    echo "${dir}"
  done
}

#
# Determine whether a given directory is already added to the PATH.
#
# usage: path_contains <directory>
#
path_contains() {
  [[ ":${PATH}:" = *":${1}:"* ]]
}

#
# Add a new directory to the path if it is not already added.
#
# usage: path_add <directory>
#
path_add() {
  [[ -d "${1}" ]] || return
  
  if ! path_contains "${1}"; then
    PATH="${1}:${PATH}"
  fi
}

# (1) Local Binaries ---------------------------------------------------- {{{1

path_add "/usr/local/sbin"
path_add "/usr/local/bin"


# (2) Package Managers -------------------------------------------------- {{{1

path_add "${COMPOSER_HOME}/vendor/bin"


# (3) Trumps ------------------------------------------------------------- {{{1

path_add "${HOME}/.local/bin"
path_add "${DOTFILES}/bin"


# (4) User Manuals ------------------------------------------------------- {{{1

if command -v manpath >/dev/null 2>&1; then
  MANPATH="$(manpath)"
fi


# }}}

export PATH
export MANPATH

# vim:foldmethod=marker:foldlevel=2
