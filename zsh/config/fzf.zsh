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
export FZF_DEFAULT_OPTS='
  --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33
  --color info:33,prompt:33,pointer:166,marker:166,spinner:33
'
