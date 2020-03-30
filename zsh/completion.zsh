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
# -----------------------------------------------------------------------


# (1) General Settings -------------------------------------------------- {{{1

# Enable the completion system
zmodload zsh/complist

# Enable cache for the completion system
zstyle ":completion:*" use-cache true
zstyle ":completion:*" cache-path "${XDG_CACHE_HOME}/zsh"


# (2) Completion Menu --------------------------------------------------- {{{1

# Unconditionally start menu selection
zstyle ":completion:*" menu "select=1"

# Use the same colors in the completion menu as used by the `ls` command
if [[ -n "${LS_COLORS}" ]]; then
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
else
  zstyle ":completion:*" list-colors "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:"
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

# Don't complete usernames
zstyle ":completion:*" users ""

# Don't complete home directories
zstyle ":completion::complete:cd:*" tag-order "! users"


# (4) Git Completions ...------------------------------------------------ {{{1

# Prefer zsh's builtin git completion
if [[ -r "/usr/local/share/zsh/site-functions/_git" ]]; then
  chmod -r "/usr/local/share/zsh/site-functions/_git"
  chmod -r "/usr/local/share/zsh/site-functions/git-completion.bash"
fi


# vim:foldmethod=marker:foldlevel=2
