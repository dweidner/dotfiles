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


[[ -d "/usr/local/opt/fzf" ]] || return


# (1) FZF Setup --------------------------------------------------------- {{{1

export FZF_DIR="/usr/local/opt/fzf"

if [[ ! "${PATH}" == *"${FZF_DIR}/bin"* ]]; then
  PATH="${PATH}:${FZF_DIR}/bin"
fi

if [[ "${SHELL_NAME}" == "bash" ]]; then
  source "${FZF_DIR}/shell/completion.bash"
  source "${FZF_DIR}/shell/key-bindings.bash"
fi

if [[ "${SHELL_NAME}" == "zsh" ]]; then
  source "${FZF_DIR}/shell/completion.zsh"
  source "${FZF_DIR}/shell/key-bindings.zsh"
fi


# (2) FZF Configuration ------------------------------------------------- {{{1

# Command used to fetch the list of files.
if dot::command_exists "rg"; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --no-ignore-vcs --glob ""'
elif dot::command_exists "ag"; then
  export FZF_DEFAULT_COMMAND='ag --hidden --silent --skip-vcs-ignores -g ""'
else
  export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
fi

# A set of default options provided to the fzf binary.
export FZF_DEFAULT_OPTS="
  --inline-info
  --height 38%
  --min-height 16
  --tabstop 4
  --reverse
  --bind '?:toggle-preview'
  --prompt '${PROMPT_SYMBOL:-❯} '
  --border
  --color light
  --color fg:23,hl:94,fg+:23,bg+:254,hl+:94
  --color info:145,prompt:33,spinner:127,pointer:33,marker:23
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

# Command used to show changes of a given file.
if dot::command_exists "diff-so-fancy"; then
  export FZF_GIT_DIFF_COMMAND="git diff --color=always -- {} | diff-so-fancy | less --tabs 4 -FRX"
else
  export FZF_GIT_DIFF_COMMAND="git diff --color=always -- {}"
fi

# Command used to show changes in the current working directory.
if dot::command_exists "diff-so-fancy"; then
  export FZF_GIT_SHOW_COMMAND="git show --color --date=short --pretty=nice | diff-so-fancy | less --tabs 4 -FRX"
else
  export FZF_GIT_SHOW_COMMAND="git show --color --date=short --pretty=nice"
fi

# Alternative command used to edit files
if dot::command_exists "code"; then
  export FZF_ALTERNATIVE_EDITOR="code"
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
# Open a selected file/directory from the bookmark list.
#
# usage: fb [<query>]
#
fb() {
  local bookmark

  bookmark="$(
    bookmark list \
      | fzf \
          --query="${1}" \
          --select-1 \
          --exit-0 \
          --preview "[[ -d {} ]] && ${FZF_DEFAULT_DIR_PREVIEW} || ${FZF_DEFAULT_FILE_PREVIEW}"
  )"

  if [[ -f "${bookmark}" ]]; then
    dot::edit "${bookmark}"
  elif [[ -d "${bookmark}" ]]; then
    cd "${bookmark}" || return
  fi
}

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
  done < <(
    fzf \
      --query="${1}" \
      --multi \
      --select-1 \
      --exit-0 \
      --expect=ctrl-o,ctrl-v \
      --preview "${FZF_DEFAULT_FILE_PREVIEW}"
  )

  if [[ "${key}" == "ctrl-o" ]]; then
    dot::open "${files[@]}"
  elif [[ "${key}" == "ctrl-v" ]]; then
    ${FZF_ALTERNATIVE_EDITOR} -- "${files[@]}"
  else
    dot::edit "${files[@]}"
  fi
}

#
# Add selected files to the git index.
#
# usage: fga [<query>]
#
fga() {
  dot::in_git_repository || return

  git ls-files \
    --modified \
    --others \
    --exclude-standard \
      | fzf \
          --query="${1}" \
          --multi \
          --print0 \
          --exit-0 \
          --preview "${FZF_DEFAULT_FILE_PREVIEW}" \
      | xargs -0 -o git add
}

#
# Display current changes since last commit of all selected files.
#
# usage: fgd [<query>]
#
fgd() {
  dot::in_git_repository || return

  local files=()

  while read -r item; do files+=("${item}"); done < <(
    git ls-files --modified \
      | fzf \
          --query="${1}" \
          --multi \
          --select-1 \
          --exit-0 \
          --preview "${FZF_GIT_DIFF_COMMAND}"
  )

  xargs -I {} sh -c "${FZF_GIT_DIFF_COMMAND}" <<< "${files[*]}"
}

#
# Browse and fetch gitignore templates from a public API endpoint.
#
# usage: fgi [<query>]
#
fgi() {
  local url="${GITIGNORE_URL:-https://www.gitignore.io/api}"
  local templates=()

  while read -r item; do templates+=("${item}"); done < <(
    curl -L -s "${url}/list" \
      | tr "," "\n" \
      | fzf \
          --query "${1}" \
          --multi \
          --preview "curl -L -s ${url}/{}"
  )

  (( ${#templates[@]} > 0 )) || return

  curl -L -s "${url}/$(tr " " "," <<< "${templates[*]}")" \
    | tail -n +5 \
    | sed '$d'
}

#
# Browse the git commit history.
#
# usage: fgl
#
fgl() {
  dot::in_git_repository || return

  git log \
    --color \
    --graph \
    --date=short \
    --pretty=nice \
      | fzf \
          --ansi \
          --no-sort \
          --preview "grep -o \"[a-f0-9]\\{7,\\}\" <<< {} | xargs ${FZF_GIT_SHOW_COMMAND}" \
      | grep -o "[a-f0-9]\\{7,\\}" \
      | xargs sh -c "${FZF_GIT_SHOW_COMMAND}"
}


# vim:foldmethod=marker:foldlevel=2
