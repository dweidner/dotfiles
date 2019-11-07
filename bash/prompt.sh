# bash/prompt.sh
#
# @file Customize the bash prompt.


# Determine the name of the current branch
__prompt_branch_name() {
  git symbolic-ref --quiet --short HEAD 2>/dev/null \
    || git rev-parse --short HEAD 2>/dev/null \
    || echo "(unknown)"
}

# Determine the status of the current git repository (clean/dirty)
__prompt_dirty() {
  git diff --no-ext-diff --quiet --ignore-submodules || echo "*"
}

# Collect information about the current git repository
__prompt_git() {
  dot::in_git_repository \
    && echo -e "${1}$(__prompt_branch_name)${2}$(__prompt_dirty)${3:-\e[0m}"
}

# Render the prompt symbol
__prompt_symbol() {
  local symbol="${PROMPT_SYMBOL:-❯}"

  if (( LAST_EXIT_CODE > 0 )); then
    echo -e "${2}${symbol}"
  else
    echo -e "${1}${symbol}"
  fi
}

# Add a custom command to environment variable
__prompt_add_command() {
  [[ ";${PROMPT_COMMAND};" = *";${1};"* ]] \
    || export PROMPT_COMMAND="$1${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
}

# Append history lines from the current session
__prompt_history_append() {
  command history -a
}

# Remember the exit status of the last command executed
__prompt_remember_exit_code() {
  export LAST_EXIT_CODE=$?
}

# Prepare both, the primary and secondary prompt
__prompt() {
  local red='\[\e[0;31m\]'
  local blue='\[\e[0;34m\]'
  local purple='\[\e[0;35m\]'
  local gray='\[\e[1;37m\]'

  local nl='\n'
  local reset='\[\e[0m\]'

  local cwd="${blue}\\w"
  local symbol="\$(__prompt_symbol \"${purple}\" \"${red}\")"
  local git="\$(__prompt_git \"${gray}\" \"${purple}\")"

  export PS1="${nl}${cwd} ${git}${nl}${symbol} ${reset}"
  export PS2="${gray}⋮${reset} "
}

# Setup the prompt and register hooks to execute before each prompt
__prompt
__prompt_add_command "__prompt_history_append"
__prompt_add_command "__prompt_remember_exit_code"
