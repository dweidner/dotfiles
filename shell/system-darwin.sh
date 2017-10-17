# shell/system-darwin.sh
#
# @file Environment variables for systems running macOS.

export DOTFILES_OS="Darwin"

export SHELL_SESSION_HISTORY=0

export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/usr/local}"
export HOMEBREW_CASK_OPTS="--appdir=${XDG_APPLICATION_DIR:-${HOME}/Applications}"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
