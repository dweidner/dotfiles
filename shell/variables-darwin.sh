# shell/variables-darwin.sh
#
# @file Environment variables for systems running macOS.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Homebrew
# 2. Tools
# -----------------------------------------------------------------------


# (1) Homebrew ---------------------------------------------------------- {{{1

if dot::command_exists "brew"; then
    eval "$(brew shellenv)"
elif [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1


# (2) Tools ------------------------------------------------------------- {{{1

export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"

export BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat/config"
export BAT_CONFIG_DIR="${XDG_DATA_HOME}/bat"
export BAT_THEME="OneHalfLight"

export COMPOSER_HOME="${XDG_CONFIG_HOME}/composer"
export COMPOSER_CACHE_DIR="${XDG_CACHE_HOME}/composer"

export TLDR_CACHE_DIR="${XDG_CACHE_HOME}/tldr"


# vim:foldmethod=marker:foldlevel=2
