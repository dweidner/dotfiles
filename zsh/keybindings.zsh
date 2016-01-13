#!/usr/bin/env zsh

# Show the contents of a directory in a menu selection
bindkey -M menuselect '^o' accept-and-infer-next-history

# Enhanced history search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey -M emacs '^P' history-search-backward
bindkey -M emacs '^N' history-search-forward
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward

# Delete key
bindkey '\e[3~' delete-char

# Customize the behavior of backward-delete-word
function slash-backward-delete-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N slash-backward-delete-word
bindkey '^W' slash-backward-delete-word
