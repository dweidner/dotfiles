#!/usr/bin/env zsh

# Load zsh color module
autoload -U colors && colors

# Use pure as default prompt
autoload -U promptinit && promptinit
PURE_PROMPT_SYMBOL="$"
prompt pure

