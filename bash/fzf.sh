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


# (4) Fzf functions ...-------------------------------------------------- {{{1

# Open selected files with the default editor
fe() {
  local -a files=()

  while IFS=$'\n' read -r file; do
    files+=("$file")
  done < <(fzf --query="$1" --multi --select-1 --exit-0)

  if (( "${#files}" > 0 )); then
    ${EDITOR:-vim} "${files[@]}"
  fi
}

# Browse the git history using fzf
fh() {
  dot::in_git_repository || return

  local hash="[a-f0-9]\\{7,\\}"
  local preview="grep -o \"${hash}\" <<< {} | xargs git show --color | head -200"

  git log --date=short --graph --color=always --pretty=nice |
    fzf --query="$1" --ansi --no-sort --multi --preview "${preview}" |
    grep -o "${hash}"
}

# Search ctags and open the selected file with the default editor
ft() {
  dot::in_git_repository || return

  local git_dir
  git_dir="$(git rev-parse --show-toplevel)/.git"

  [[ -r "$git_dir/tags" ]] || return

  local selection
  selection="$(awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2}' "$git_dir/tags" | fzf --query="$1" --nth=2,3)"

  [[ $? -eq 0 ]] || return

  local tag
  tag="$(cut -f2 <<< "$selection")"

  local file
  file="$(cut -f3 <<< "$selection")"

  if [[ -r "$git_dir/$file" ]]; then
    ${EDITOR:-vim} "$git_dir/$file" -c "set cscopetag" -c "silent tag ${tag}"
  fi
}


# (5) Configuration ----------------------------------------------------- {{{1

export FZF_DEFAULT_OPTS="
  --reverse
  --inline-info
  --color light
  --height 50%
  --prompt '${PROMPT_SYMBOL:-❯} '
  --preview-window hidden
  --bind '?:toggle-preview'
  --bind 'ctrl-g:jump-accept'
"

export FZF_CTRL_T_OPTS="
  --preview '[[ \\\$(file --mime {}) =~ binary ]] && file -b {} || (highlight -O ansi -l {} || cat {}) 2>/dev/null | head -100 {}'
"

export FZF_ALT_C_OPTS="
  --preview 'tree --noreport --dirsfirst -C {} | head -100'
"


# vim:foldmethod=marker:foldlevel=2
