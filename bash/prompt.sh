# shell/bash_prompt
#
# @file Customize the bash prompt.

#
# Determine the status of a git branch
#
# A helper function used to determine the branch name of a git repository and
# its status.
#
# Usage: __bash_prompt_branch
#
__bash_prompt_branch() {
  dot::in_git_repository || return

  local branch
  local status

  # Determine the name of the current branch:
  # 1. Use the short symbolic reference, if available
  # 2. Use the short SHA as a fallback
  # 3. Give up otherwise
  branch="$(
    git symbolic-ref --quiet --short HEAD 2>/dev/null || \
    git rev-parse --short HEAD 2>/dev/null || \
    echo "${PROMPT_BRANCH_UNKNOWN:-(unknown)}"
  )"

  # Determine the status of the current git direcotry (clean/dirty)
  if [ -n "$(git status --short 2>/dev/null)" ]; then
    status="${PROMPT_BRANCH_DIRTY:-*}"
  fi

  # Return the name of the current branch and its current status
  echo -e "$branch$status"
}

#
# Prepare the bash prompt
#
# Mimic the appearance of the zsh prompt theme ‘pure’ in bash.
#
# Usage: __bash_prompt
#
__bash_prompt() {
  local symbol="${PROMPT_SYMBOL:-❯}"

  local black="\[\e[0;30m\]"
  local red="\[\e[0;31m\]"
  local green="\[\e[0;32m\]"
  local yellow="\[\e[0;33m\]"
  local blue="\[\e[0;34m\]"
  local magenta="\[\e[0;35m\]"
  local cyan="\[\e[0;36m\]"
  local white="\[\e[0;37\]"
  local reset="\[\e[0m\]"

  # Customize the shell prompt
  # 1. Display the current working directory
  # 2. Display the currently checked out branch of a git repository
  # 3. Display the user name and host when connected to a remote server
  # 4. Display the prompt symbol in red when the last command failed
  PS1="\n$blue\w$reset "
  PS1+="\$(__bash_prompt_branch) "
  PS1+="\$([ -n \"\$SSH_CONNECTION\" ] && echo \"$gray\u@\h$reset\") "
  PS1+="\n\$( (( \$? )) && echo -e \"$magenta\" || echo -e \"$red\" )$symbol$reset "

  # Make the changes to the prompt permanent
  export PS1
}

__bash_prompt
