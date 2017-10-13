# shell/functions.sh
#
# @file Utilitiy functions used in interactive shells


#
# Switch to the given directory and list the directory contents.
#
# Usage: cdl [<path>]
#
cdl() {
  builtin cd -- "$1" && command "${LS_BINARY:-ls}" -lhF "${ls_options[@]}"
}

#
# Switch to the root directory of the current git repository.
#
# Usage: cdr
#
cdr() {
  git rev-parse || return 1
  builtin cd "$(git rev-parse --show-cdup)" || return 1
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
# Display the weather for a given city.
# 
# Usage: weather [<city>]
#
weather() {
  curl "wttr.in/~${1:-Bremen}"
}
