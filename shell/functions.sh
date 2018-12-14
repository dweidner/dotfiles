# shell/functions.sh
#
# @file Utilitiy functions used in interactive shells


#
# Switch to a bookmarked directory.
#
# usage: cdb <keyword>
#
cdb() {
  local needle="$*"

  local directory
  directory="$(bookmark find -type d "$needle" | head -n1)"

  if [[ -d "$directory" ]]; then
    builtin cd -- "$directory"
  else
    echo "cdb: $needle: Bookmark not found" >&2
  fi
}

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
# Display log output for a given service.
#
# usage: dcl [<service>]
#
dcl() {
  local name="${1}"

  if [[ -z "${name}" ]]; then
    docker-compose logs -f --tail 100
    return
  fi

  local id
  id="$(docker-compose ps -q "${name}" 2>/dev/null)"

  if [[ -z "${id}" ]]; then
    return
  fi

  docker logs --follow --since 1h "${id}"
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
# Remove directories from the stack.
#
# usage: po [<directory>]
#
po() {
  builtin popd "$@" >/dev/null || return
  builtin dirs -v
}

#
# Add directories to the stack.
#
# usage: pu [<directory>]
#
pu() {
  builtin pushd "$@" >/dev/null || return
  builtin dirs -v
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
