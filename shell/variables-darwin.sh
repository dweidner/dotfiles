# shell/variables-darwin.sh
#
# @file Environment variables for systems running macOS.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Homebrew
# 2. FZF
# 3. BAT
# 4. TLDR
# 5. Composer
# -----------------------------------------------------------------------


# (1) Homebrew ---------------------------------------------------------- {{{1

if dot::command_exists "brew"; then
    eval "$(brew shellenv)"
elif [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1


# (2) FZF --------------------------------------------------------------- {{{1

if dot::command_exists "bat"; then
  FZF_FILE_PREVIEW_COMMAND="bat --color always --style changes,numbers {} 2>/dev/null"
else
  FZF_FILE_PREVIEW_COMMAND="cat {} 2>/dev/null"
fi

if dot::command_exists "tree"; then
  FZF_DIR_PREVIEW_COMMAND="tree --noreport --dirsfirst -C -L 7 {} | head -100"
else
  FZF_DIR_PREVIEW_COMMAND="ls -1 {} | head -100"
fi

if dot::command_exists "fd"; then
  export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore-vcs'
elif dot::command_exists "rg"; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --no-ignore-vcs --glob ""'
elif dot::command_exists "ag"; then
  export FZF_DEFAULT_COMMAND='ag --hidden --silent --skip-vcs-ignores -g ""'
else
  export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
fi

export FZF_DEFAULT_OPTS="
  --inline-info
  --min-height 16
  --height 38%
  --tabstop 4
  --reverse
  --bind '?:toggle-preview'
  --prompt '${PROMPT_SYMBOL:-❯} '
  --border
  --color light
  --color fg:8,hl:4,fg+:8,bg+:254,hl+:4
  --color header:242,info:242,prompt:5,spinner:242,pointer:5,marker:5,border:254
  --preview-window right:62%:hidden
"

export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_CTRL_T_OPTS="--preview '[[ \$(file --mime {}) =~ binary ]] && file -b {} || ${FZF_FILE_PREVIEW_COMMAND}'"

export FZF_ALT_C_OPTS="--preview '${FZF_DIR_PREVIEW_COMMAND}'"

unset FZF_FILE_PREVIEW_COMMAND
unset FZF_DIR_PREVIEW_COMMAND


# (3) BAT --------------------------------------------------------------- {{{1

export BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat/config"
export BAT_CONFIG_DIR="${XDG_DATA_HOME}/bat"
export BAT_THEME="OneHalfLight"


# (4) TLDR -------------------------------------------------------------- {{{1

export TLDR_CACHE_DIR="${XDG_CACHE_HOME}/tldr"


# (5) Composer ---------------------------------------------------------- {{{1

export COMPOSER_HOME="${XDG_CONFIG_HOME}/composer"
export COMPOSER_CACHE_DIR="${XDG_CACHE_HOME}/composer"


# (6) Docker ------------------------------------------------------------ {{{1

if [[ -S "${HOME}/.colima/default/docker.sock" ]]; then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
fi


# vim:foldmethod=marker:foldlevel=2
