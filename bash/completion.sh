# bash/completion.sh
#
# @file Enable bash completion.


# (1) System completions ------------------------------------------------ {{{1

# Load bash completions installed in system paths
if [[ -r "/usr/local/etc/bash_completion" ]]; then
  source "/usr/local/etc/bash_completion"
elif [[ -r "/etc/bash_completion" ]]; then
  source "/etc/bash_completion"
fi


# (2) Third Party completions ------------------------------------------- {{{1

# Load bash completion package installed via homebrew
if (( BASH_VERSINFO[0] >= 4 )); then
  [[ -r "${HOMEBREW_PREFIX}/share/bash-completion/bash_completion" ]] \
    && source "${HOMEBREW_PREFIX}/share/bash-completion/bash_completion"
fi

# Enable completion for the custom git alias
if dot::function_exists "__git_complete"; then
  __git_complete g __git_main
fi

# vim:foldmethod=marker:foldlevel=2
