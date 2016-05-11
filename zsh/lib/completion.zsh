# zsh/lib/completion.zsh

# -------------------------------------
# Table of Contents
# -------------------------------------
# 1. Completion Options
# 2. Completion Styles
# 3. Colorize Completions
# -------------------------------------


# 1. Completion Options --------------- {{{1

setopt COMPLETE_IN_WORD   # Complete from both ends of a word
setopt ALWAYS_TO_END      # Move the cursor to the end of a completed word
setopt AUTO_MENU          # Show completion menu on successive tab press
setopt AUTO_LIST          # List choices on ambiguous completion
setopt AUTO_PARAM_SLASH   # Add trailing slash to directories

unsetopt CASE_GLOB        # Make globbing case-insensitive
unsetopt FLOW_CONTROL     # Disable start/stop characters in editor
unsetopt MENU_COMPLETE    # List poissibilities on completion


# 2. Completion Styles ---------------- {{{1

# Setup new style completion system
autoload -Uz compinit && compinit -i

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select=1

# Use cache to proxy the result list of complex commands like brew
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/compcache"

if [[ ! -d "$HOME/.cache/zsh/compcache" ]]; then
  mkdir -p "$HOME/.cache/zsh/compcache"
fi

# Enable case-insensitive fuzzy matching of completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Ignore autocomplete functions and hooks
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Customize formatting of matches
zstyle ':completion:*:matches' group true
zstyle ':completion:*:options' description true
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d -- %f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches %s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose true

# Enable autocomplete for processes
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'

# Autocomplete process for the kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Separate man page sections
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true


# 3. Colorize Completions ------------- {{{1

# Use the same colors in the completion menu as used by the
# `list directories` command
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  zstyle ':completion:*:default' list-colors ''
fi


# vim:foldmethod=marker:foldlevel=2
