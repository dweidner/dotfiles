# zsh/completion.zsh
#
# @file Enable zsh completion.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. General Settings
# 2. Look & Feel
# -----------------------------------------------------------------------


# (1) General Settings -------------------------------------------------- {{{1

# Enable the completion system
zmodload zsh/complist

# Unconditionally start menu selection
zstyle ":completion:*" menu select

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


# (2) Look & Feel ------------------------------------------------------- {{{1

# Use the same colors in the completion menu as used by the `ls` command
if [[ -n "${LS_COLORS}" ]]; then
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
else
  zstyle ":completion:*" list-colors "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:"
fi


# vim:foldmethod=marker:foldlevel=2
