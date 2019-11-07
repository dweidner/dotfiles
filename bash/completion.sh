# bash/completion.sh
#
# @file Enable bash completion.


# (1) Completion utilities ---------------------------------------------- {{{1

#
# A helper function used to suggest directories at a given path for
# auto completion. The function is used to generate auto suggestion for
# custom functions like cdd, cdf and cdr.
#
# usage: dot::complete_directories <path>
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


# (2) Completion functions ---------------------------------------------- {{{1

# Load bash completions installed in system paths
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  source "/usr/local/etc/profile.d/bash_completion.sh"
fi

if [[ -r "/usr/local/etc/bash_completion" ]]; then
  source "/usr/local/etc/bash_completion"
fi

if [[ -r "/etc/bash_completion" ]]; then
  source "/etc/bash_completion"
fi


# (3) FZF completions --------------------------------------------------- {{{1

# Enable path completion for custom aliases
if dot::function_exists "_fzf_path_completion"; then
  for cmd in "b" "c" "d" "e"; do
    complete -F _fzf_path_completion -o default -o bashdefault "${cmd}"
  done
fi

# Enable directory completion for custom commands
if dot::function_exists "_fzf_dir_completion"; then
  for cmd in "pu" "tree"; do
    complete -F _fzf_dir_completion -o nospace -o dirnames "${cmd}"
  done
fi


# vim:foldmethod=marker:foldlevel=2
