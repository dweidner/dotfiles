# shell/variables-darwin.sh
#
# @file Environment variables for systems running macOS.


export DOTFILES_OS="Darwin"
export DOTFILES_THEME="One Light"

export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/usr/local}"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"

export BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat/config"
export BAT_CONFIG_DIR="${XDG_DATA_HOME}/bat"
export BAT_THEME="OneHalfLight"

export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export DOCKER_TMPDIR="/var/tmp"

export DRUSH_PATHS_CACHE_DIRECTORY="${XDG_CACHE_HOME}/drush"

export TLDR_CACHE_DIR="${XDG_CACHE_HOME}/tldr"