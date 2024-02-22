# zsh/completion.zsh
#
# @file Enable zsh completion.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. General Settings
# 2. Completion Menu
# 3. Completion Matching
# 4. FZF Completions
# -----------------------------------------------------------------------


# (1) General Settings -------------------------------------------------- {{{1

# Enable the completion system
zmodload zsh/complist

# Enable cache for the completion system
zstyle ":completion:*" use-cache true
zstyle ":completion:*" cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"


# (2) Completion Menu --------------------------------------------------- {{{1

# Unconditionally start menu selection
zstyle ":completion:*" menu "select=1"

# Use the same colors in the completion menu as used by the `ls` command
if [[ -n "${LS_COLORS}" ]]; then
  zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
else
  zstyle ":completion:*:default" list-colors "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:"
fi

# List directories first in the menu
zstyle ":completion:*" list-dirs-first true


# (3) Completion Matching ----------------------------------------------- {{{1

# Try:
# 1) smart-case completion
# 2) case-insensitive completion
# 3) partial-word completion
# 4) substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-z}={A-Z}" \
  "m:{a-zA-Z}={A-Z}{a-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"

# Don't complete directories in cdpath
zstyle ":completion::complete:(cd|pushd):*" tag-order \
  !path-directories \
  !users

# Don't complete usernames
zstyle ":completion:*" users ""

# (4) FZF Completions --------------------------------------------------- {{{1

# Load completion functions shipping with fzf
if [[ -r "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh" ]]; then
  source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh"
fi


# vim:foldmethod=marker:foldlevel=2
