# shell/fzf.sh
#
# @file Load command-line fuzzy finder
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. FZF Setup
# 2. FZF Configuration
# 3. FZF Functions
# -----------------------------------------------------------------------


[[ -d "/opt/homebrew/opt/fzf" ]] || return


# (1) FZF Setup --------------------------------------------------------- {{{1

export FZF_DIR="/opt/homebrew/opt/fzf"

if [[ "${PATH}" != *"${FZF_DIR}/bin"* ]]; then
  PATH="${PATH}:${FZF_DIR}/bin"
fi

if [[ "${SHELL}" == */bash ]]; then
  source "${FZF_DIR}/shell/completion.bash"
  source "${FZF_DIR}/shell/key-bindings.bash"
elif [[ "${SHELL}" == */zsh ]]; then
  source "${FZF_DIR}/shell/completion.zsh"
  source "${FZF_DIR}/shell/key-bindings.zsh"
fi


# (2) FZF Configuration ------------------------------------------------- {{{1

# Command used to fetch the list of files.
if dot::command_exists "fd"; then
  export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore-vcs'
elif dot::command_exists "rg"; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --no-ignore-vcs --glob ""'
elif dot::command_exists "ag"; then
  export FZF_DEFAULT_COMMAND='ag --hidden --silent --skip-vcs-ignores -g ""'
else
  export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
fi

# A set of default options provided to the fzf binary.
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
# Command used to generate a preview for a generic text file.
if dot::command_exists "bat"; then
  export FZF_DEFAULT_FILE_PREVIEW="bat --color always --style changes,numbers {} 2>/dev/null"
else
  export FZF_DEFAULT_FILE_PREVIEW="cat {} 2>/dev/null"
fi

# Command used to generate a preview of the contents of a directory.
if dot::command_exists "tree"; then
  export FZF_DEFAULT_DIR_PREVIEW="tree --noreport --dirsfirst -C -L 7 {} | head -100"
else
  export FZF_DEFAULT_DIR_PREVIEW="ls -1 {} | head -100"
fi

# Alternative command used to edit files
if dot::command_exists "code"; then
  export FZF_ALTERNATIVE_EDITOR="code"
elif dot::command_exists "atom"; then
  export FZF_ALTNERNATIVE_EDITOR="atom"
else
  export FZF_ALTERNATIVE_EDITOR="${EDITOR}"
fi

# Options used when the directory widget is executed via the ALT-C key binding.
export FZF_ALT_C_PREVIEW="${FZF_DEFAULT_DIR_PREVIEW}"
export FZF_ALT_C_OPTS="--preview '${FZF_ALT_C_PREVIEW}'"

# Options used when the file widget is executed via the CTRL-T key binding.
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_CTRL_T_PREVIEW="[[ \$(file --mime {}) =~ binary ]] && file -b {} || ${FZF_DEFAULT_FILE_PREVIEW}"
export FZF_CTRL_T_OPTS="--preview '${FZF_CTRL_T_PREVIEW}'"


# (3) FZF Functions ----------------------------------------------------- {{{1

#
# Open selected files (with the default editor).
#
# usage: fe [<query>]
#
fe() {
  local files=()

  local item
  local key

  while read -r item; do
    if [[ -z "${item}" ]] || [[ "${item}" == "ctrl-"? ]]; then
      key="${item}"
    else
      files+=("${item}")
    fi
  done <<<"$(
    fzf \
      --query="${1}" \
      --multi \
      --select-1 \
      --exit-0 \
      --expect=ctrl-o,ctrl-e \
      --preview "${FZF_DEFAULT_FILE_PREVIEW}"
  )"

  if [[ "${key}" == "ctrl-o" ]]; then
    dot::open "${files[@]}"
  elif [[ "${key}" == "ctrl-e" ]]; then
    ${FZF_ALTERNATIVE_EDITOR} -- "${files[@]}"
  else
    dot::edit "${files[@]}"
  fi
}


# vim:foldmethod=marker:foldlevel=2
