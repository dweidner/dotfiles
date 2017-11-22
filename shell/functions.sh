# shell/functions.sh
#
# @file Utilitiy functions used in interactive shells


#
# Switch to the given directory of the dotfiles repository.
#
# usage: cdd [<path>]
#
cdd() {
  builtin cd -- "$DOTFILES/$1"
}

#
# Switch to the given directory and list the directory contents.
#
# usage: cdl [<path>]
#
cdl() {
  builtin cd -- "$1" && command ls -lhF "${ls_options[@]}"
}

#
# Switch to the given directory starting from the root the current git
# repository.
#
# usage: cdr [<path>]
#
cdr() {
  local root=""
  root="$(git rev-parse --show-toplevel)"

  if [[ $? -ne 0 ]]; then
    return 1
  fi

  builtin cd -- "$root/$1"
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
# usage: fs [<path>]
#
fs() {
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

  if command -v python >/dev/null 2>&1; then
    python -m SimpleHttpServer "$port"
  elif command -v http-server >/dev/null 2>&1; then
    http-server -p "$port"
  else
    dot::error "Missing required commands used to start an http server"
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
# Display the weather for a given city.
#
# usage: weather [<city>]
#
weather() {
  curl "wttr.in/~${1:-Bremen}"
}
