# bash/fzf.sh
#
# @file Load command-line fuzzy finder

[[ -d "/usr/local/opt/fzf" ]] || return


# (1) Path customization ------------------------------------------------ {{{1

export FZF_DIR="/usr/local/opt/fzf"

if [[ -d "${FZF_DIR}/bin" ]]; then
  path_add "${FZF_DIR}/bin"
fi


# (2) Auto-completion --------------------------------------------------- {{{1

if [[ -s "${FZF_DIR}/shell/completion.bash" ]]; then
  source "${FZF_DIR}/shell/completion.bash"
fi


# (3) Key bindings ------------------------------------------------------ {{{1

if [[ -s "${FZF_DIR}/shell/key-bindings.bash" ]]; then
  source "${FZF_DIR}/shell/key-bindings.bash"
fi


# (4) Configuration ----------------------------------------------------- {{{1

if dot::command_exists "rg"; then
  export FZF_DEFAULT_COMMAND='rg --files --glob ""'
elif dot::command_exists "ag"; then
  export FZF_DEFAULT_COMMAND='ag -g ""'
else
  export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
fi

export FZF_DEFAULT_OPTS="
  --reverse
  --inline-info
  --color light
  --height 50%
  --preview-window hidden
  --bind '?:toggle-preview'
  --bind 'ctrl-g:jump-accept'
  --prompt '${PROMPT_SYMBOL:-❯} '
  --color fg:23,hl:94,fg+:23,bg+:254,hl+:94
  --color info:145,prompt:33,spinner:127,pointer:33,marker:23
"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_CTRL_T_OPTS="
  --preview '[[ \$(file --mime {}) =~ binary ]] && file -b {} || cat {} 2>/dev/null'
"

export FZF_ALT_C_OPTS="
  --preview 'tree --noreport --dirsfirst -C {} | head -100'
"


# (5) FZF functions ----------------------------------------------------- {{{1

# Open file/directory from bookmark list
fb() {
  local path
  path="$(bookmark list | fzf --query="$1" --select-1 --exit-0)"

  if [[ -d "$path" ]]; then
    cd "$path" || return
  elif [[ -f "$path" ]]; then
    ${EDITOR:-vim} -- "$path"
    printf "%s\\n" "$path"
  fi
}

# Open selected files with the default editor
fe() {
  local -a files=()

  while IFS=$'\n' read -r file; do
    files+=("$file")
  done < <(fzf --query="$1" --multi --select-1 --exit-0)

  if (( "${#files}" > 0 )); then
    ${EDITOR:-vim} -- "${files[@]}"
    printf "./%s\\n" "${files[@]}"
  fi
}

# Searching file contents with ripgrep and open selection with editor
fg() {
  local -a grep_cmd=()

  if dot::command_exists "rg"; then
    grep_cmd+=( rg --line-number --no-heading . )
  elif dot::command_exists "ag"; then
    grep_cmd+=( ag --line-number --nogroup . )
  else
    grep_cmd+=( grep -r "" --line-number --line-buffered ./* )
  fi

  local selection
  selection="$("${grep_cmd[@]}" | fzf --query="$1" --delimiter=: --nth=2.. --with-nth=1,3.. --preview="cut -d: -f1 <<< {} | xargs cat 2>/dev/null")"

  local file
  file="$(cut -d: -f1 <<< "$selection")"

  local line
  line="$(cut -d: -f2 <<< "$selection")"

  if [[ -r "$file" ]]; then
    ${EDITOR:-vim} +"$line" "$file"
    printf "./%s\\n" "${file}"
  fi
}

# Browse the git commit log
fl() {
  dot::in_git_repository || return

  local shell="${SHELL:-/bin/sh}"
  local needle="[a-f0-9]\\{7,\\}"

  local git_show="git show --color --date=short --pretty=nice"

  if dot::command_exists "diff-so-fancy"; then
    git_show="${git_show} | diff-so-fancy"
  fi

  local sha1
  sha1=$(
    git log --color=always --graph --date=short --pretty=nice \
      | fzf --ansi --no-sort --preview "grep -o \"${needle}\" <<< {} | xargs ${git_show}" \
      | grep -o "$needle"
  )

  if [[ -n "$sha1" ]]; then
    xargs "$shell" -c "$git_show | less --tabs=4 -FRX" <<< "$sha1"
  fi
}

# Search ctags and open the selected file with the default editor
ft() {
  dot::in_git_repository || return

  local git_dir
  git_dir="$(git rev-parse --git-dir)"

  [[ -r "${git_dir}/tags" ]] || return

  local selection
  selection="$(awk 'BEGIN { FS="\t" } !/^!/ { sub("^../","",$2); print toupper($4) "\t" $1 "\t" $2; }' "${git_dir}/tags" | fzf --query="$1" --nth=2)"

  [[ $? -eq 0 ]] || return

  local tag
  tag="$(cut -f2 <<< "$selection")"

  local file
  file="$(cut -f3 <<< "$selection")"
  file="$(realpath --quiet --relative-to="${PWD}" "${git_dir}/../${file}")"

  if [[ -r "${file}" ]]; then
    ${EDITOR:-vim} "${file}" -c "silent 1tag ${tag}"
    printf "./%s\\n" "${file}"
  fi
}


# vim:foldmethod=marker:foldlevel=2
