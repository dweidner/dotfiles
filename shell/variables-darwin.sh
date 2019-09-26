# shell/variables-darwin.sh
#
# @file Environment variables for systems running macOS.


export DOTFILES_OS="Darwin"

export CLICOLORS=1

export BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat/config"
export BAT_CONFIG_DIR="${XDG_DATA_HOME}/bat"
export BAT_THEME="OneHalfLight"

export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/usr/local}"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
