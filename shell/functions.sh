# shell/functions.sh
#
# @file Utilitiy functions used in interactive shells


#
# Switch to the given directory of the dotfiles repository.
#
# usage: cdd [<path>]
#
cdd() {
  local base="${DOTFILES:-$HOME/.config/dotfiles}"

  if [[ -d "$base" ]]; then
    builtin cd -- "$base/$*"
  fi
}

#
# Switch to the given path relative to the currently selected finder
# directory.
#
# usage: cdf [<path>]
#
cdf() {
  local base
  base="$(printfd)"

  if [[ -d "$base" ]]; then
    builtin cd -- "$base/$*"
  fi
}

#
# Switch to the given directory and list the directory contents.
#
# usage: cdl [<path>]
#
cdl() {
  builtin cd -- "$*" && command ls -lhF "${ls_options[@]}"
}

#
# Switch to the given directory starting from the root the current git
# repository.
#
# usage: cdr [<path>]
#
cdr() {
  local base
  base="$(git rev-parse --show-toplevel)"

  if [[ -d "$base" ]]; then
    builtin cd -- "$base/$*"
  fi
}

#
# Find files whose name matches a given pattern.
#
# usage: ff <pattern>
#
ff() {
  find . -type f -iname '*'"$*"'*' -exec ls "${ls_options[@]}" -- {} \;
}

#
# Determine the size of file or directory.
#
# usage: fsize [<path>]
#
fsize() {
  local -a options
  options+=( -sh )

  if du -b /dev/null >/dev/null 2>&1; then
    options+=( -b )
  fi

  if [[ -n "$*" ]]; then
    du "${options[*]}" -- "$@"
  else
    du "${options[*]}" .[^.]* ./*
  fi
}

#
# Start an http server at the given port and serve the current directory.
#
# usage: serve [<port>]
#
serve() {
  local port="${1:-3000}"

  if dot::command_exists "php"; then
    php -S "localhost:${port}"
  elif dot::command_exists "http-server"; then
    http-server -p "$port"
  elif dot::command_exists "python"; then
    python -m SimpleHTTPServer "$port"
  else
    dot::error "Cannot start an http server at the current directory"
  fi
}

#
# Supress output if a given command and run it in the background. Does not
# supress error messages.
#
# usage: silent <command>
#
silent() {
  "$@" >/dev/null &
}

#
# Generate an index file of names found in source and header files using the
# (exuberant) ctags command.
#
# usage: tags
#
tags() {
  if ! dot::in_git_repository; then
    ctags --recurse "$@"
    return $?
  fi

  local base
  base="$(git rev-parse --git-dir)"
  ctags --recurse -f "${base}/tags" "$@"
}

#
# Display the weather for a given city.
#
# usage: weather [<city>]
#
weather() {
  curl "wttr.in/~${1:-Bremen}"
}
