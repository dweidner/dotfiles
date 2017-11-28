# bash/completion.sh
#
# @file Enable bash completion.


# (1) Utility functions ------------------------------------------------- {{{1

#
# A helper function used to suggest directories at a given path for
# auto completion. The function is used to generate auto suggestion for
# custom functions like cdd, cdf and cdr.
#
# usage: _complete_directories <path>
#
dot::complete_directories() {
  local IFS=$'\n'

  local root="${1%/}"
  local count="${#COMPREPLY[@]}"

  if [[ ! -d "$root" ]]; then
    return 1
  fi

  local cur
  _get_comp_words_by_ref cur

  for dir in $(compgen -d -- "$root/$cur"); do
    COMPREPLY[count++]="${dir#$root/}/"
  done

  return 0
}


# (2) Load extensions --------------------------------------------------- {{{1

# Load bash completions installed in system paths
if [[ -r "/usr/local/etc/bash_completion" ]]; then
  source "/usr/local/etc/bash_completion"
elif [[ -r "/etc/bash_completion" ]]; then
  source "/etc/bash_completion"
fi

# Load bash completion bundle installed via homebrew
if (( BASH_VERSINFO[0] >= 4 )); then
  if [[ -r "${HOMEBREW_PREFIX}/share/bash-completion/bash_completion" ]]; then
    source "${HOMEBREW_PREFIX}/share/bash-completion/bash_completion"
  fi
fi


# vim:foldmethod=marker:foldlevel=2
