# zsh/lib/fzf.zsh

# Ensure fzf is installed on the current system
(( $+commands[fzf] )) || return

# Try to determine the source path
if type brew >/dev/null 2>&1; then
  FZF_BASE="$(brew --prefix fzf)"
else
  FZF_BASE="${FZF_BASE:-/usr/local/opt/fzf}"
fi

# Ensure that the path we retrieved exists
[ -d "$FZF_BASE" ] || return

# Enable fuzzy completion for files and directories
source "$FZF_BASE/shell/completion.zsh"

# Enable useful keybindings used to open fzf at the current directory
source "$FZF_BASE/shell/key-bindings.zsh"

# Use a solarized light inspired color scheme
FZF_DEFAULT_OPTS+=" --color light,hl:33,hl+:33,fg+:241,bg+:221"
FZF_DEFAULT_OPTS+=" --color info:33,prompt:33,pointer:166,marker:166,spinner:33"

# Alternative: Use a solarized dark inspired color scheme
# FZF_DEFAULT_OPTS+=" --color dark,hl:33,hl+:37,bg+:136,fg+:254"
# FZF_DEFAULT_OPTS+=" --color info:254,prompt:37,spinner:108,pointer:235,marker:235"

# Export changes to the collection of default options used by fzf
export FZF_DEFAULT_OPTS
