# zsh/lib/fzf.zsh

# -------------------------------------
# Table of Contents
# -------------------------------------
# 1. Initialization
# 2. Options
# 3. Aliases & Functions
# -------------------------------------


# 1. Initialization ------------------- {{{1

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


# 2. Options -------------------------- {{{1

# Use “The Silver Search” as the default command for FZF
if (( $+commands[ag] )); then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g "" 2>/dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND | with-directories"
fi

# Use $ as the finder prompt
FZF_DEFAULT_OPTS+=" --prompt '$ '"

# Display finder info inline with the query
FZF_DEFAULT_OPTS+=" --inline-info"

# Use a solarized light inspired color scheme
FZF_DEFAULT_OPTS+=" --color light,hl:33,hl+:33,fg+:241,bg+:221"
FZF_DEFAULT_OPTS+=" --color info:33,prompt:33,pointer:166,marker:166,spinner:33"

# Alternative: Use a solarized dark inspired color scheme
# FZF_DEFAULT_OPTS+=" --color dark,hl:33,hl+:37,fg+:254,bg+:136"
# FZF_DEFAULT_OPTS+=" --color info:254,prompt:37,pointer:235,marker:235,spinner:108"

# Export changes to the collection of default options used by fzf
export FZF_DEFAULT_OPTS


# 3. Aliases & Functions -------------- {{{1

# Change current directory to the folder selected in the fuzzy finder.
fd() {
  local dir
  dir="$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux)" && cd "$dir"
}

# Open all files selected in the fuzzy finder in the default editor.
fe() {
  local files

  files=(${(f)"$(fzf-tmux --query="$1" --multi --select-1 --exit-0)"})

  if [ -n "$files" ]; then
    ${EDITOR:-vim} -- "${files[@]}"
  fi
}

# Search and browse the git history of the current git repository.
fgh() {
  is_git_repository &&
    git log --pretty=nice --decorate "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index \
      --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute: (
          grep -o '[a-f0-9]\{7,\}' |
          head -1 |
          xargs -I % sh -c 'git show --color=always % | less -R'
        ) << 'FZF-EOF'
        {}"
}

# Search files that have differences between the index file and the current
# HEAD commit.
__fzf_select_modified() {
  is_git_repository &&
    git status --short |
    fzf-tmux -d 40% --multi --ansi --nth 2..,.. |
    awk '{print $2}'
}

# Search recently used files.
__fzf_select_mru() {
  mru | fzf-tmux --multi | while read file; do
    echo -n "${file//\~/$HOME}"
  done
  echo
}


# vim:foldmethod=marker:foldlevel=2
