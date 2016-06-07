# zsh/config/prompt.zsh

#
# Helper function to display the projects node version.
#
# Usage: prompt_dotfiles_node_version
#
prompt_dotfiles_node_version() {
  # Ensure nodenv is installed
  type nodenv >/dev/null 2>&1 || return

  # Determine the node version used in the current directory
  local version
  version="$(nodenv local 2>/dev/null)"

  # The current directory does not use a local node version
  [[ $? -ne 0 || -z "$version" ]] && return

  # Return the string to display on the prompt
  echo "(${DOTFILES_PROMPT_NODE_PREFIX:-"node@"}$version)"
}

#
# Helper function to display the projects ruby version.
#
# Usage: prompt_dotfiles_ruby_version
#
prompt_dotfiles_ruby_version() {
  # Ensure rbenv is installed
  type rbenv >/dev/null 2>&1 || return

  # Determine the ruby version used in the current directory
  local version
  version="$(rbenv local 2>/dev/null)"

  # The current directory does not use a local ruby version
  [[ $? -ne 0 || -z "$version" ]] && return

  # Return the string to display on the prompt
  echo "(${DOTFILES_PROMPT_RUBY_PREFIX:-"ruby@"}$version)"
}

#
# Callback function executed before each prompt.
#
prompt_dotfiles_precmd() {
  RPROMPT="%F{242}$(prompt_dotfiles_ruby_version)$(prompt_dotfiles_node_version)%f"
}

#
# Helper function used to setup the zsh prompt.
#
prompt_dotfiles_setup() {
  # Ensure pure is installed via zplug
  zplug check "sindresorhus/pure" >/dev/null 2>&1 || return 1

  # Load dependencies
  autoload -Uz add-zsh-hook
  autoload -Uz promptinit && promptinit

  # Use sindresorhus’ pure prompt with a custom symbol
  export PURE_PROMPT_SYMBOL="$"
  prompt pure

  # Customize the right prompt
  add-zsh-hook precmd prompt_dotfiles_precmd
}

prompt_dotfiles_setup "$@"
