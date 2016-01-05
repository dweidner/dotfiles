#!/usr/bin/env zsh

# Load autocomplete module
autoload -U compinit && compinit

# Set general autocomplete options
unsetopt BEEP
unsetopt MENU_COMPLETE
unsetopt FLOW_CONTROL
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# Load complist library if not already done:
# - Allows to move the cursor to select items in the menu selection
# - Allows to customize colors in the menu selection
zmodload -i zsh/complist

# Start menu selection if an ambiguous completion produces at least <NUM> possibilites
zstyle ':completion:*' menu select=1

# Use cache to proxy the result list of complex commands like brew
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Enable case-insensitive fuzzy matching of completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '_*'

# Organize the menu into groups and add further information
zstyle ':completion:*:descriptions' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' verbose true

# Use colors in the menu similar to GNU ls
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
  zstyle ':completion:*' list-colors ''
fi

# Enable autocomplete for processes
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
