# shell/utilities.sh
#
# @file Some utility functions used throughout the dotfiles.


#
# Determine whether the current working directory is a git repository.
#
# usage: dot::in_git_repository
#
dot::in_git_repository() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

#
# Determine whether a command with the given name exists in the current
# environment.
#
# usage: dot::command_exists <name>
#
dot::command_exists() {
  command -v "$1" >/dev/null 2>&1
}

#
# Determine whether a function with the given name exists.
#
# Tries to declare the function which will return with an exit code > 0 if
# a function with the given name already exists (supposed to be faster than
# executing type -f).
#
# usage: dot::function_exists <name>
#
dot::function_exists() {
  declare -fF "$1" >/dev/null
  return $?
}

#
# Print a status message.
#
# usage: dot::info <message>
#
dot::info() {
  echo -e "\033[0;34m$*\033[0;m"
}

#
# Print a message after a successfull operation.
#
# usage: dot::ok <message>
#
dot::ok() {
  echo -e "\033[0;32m$*\033[0;m"
}

#
# Print a warning message.
#
# usage: dot::warning <message>
#
dot::warning() {
  echo -e "\033[0;33m$*\033[0;m" >&2
}

#
# Print an error message.
#
# usage: dot::error <message>
#
dot::error() {
  echo -e "\033[0;31m$*\033[0;m" >&2
}

#
# Confirm a question with the user.
#
# usage: dot::confirm <question>
#
dot::confirm() {
  read -r -p $'\e[0;32m'"$* (y/n [n]) "$'\e[0;m' answer

  case "$answer" in
    y|Y) return 0 ;;
    *) return 1 ;;
  esac
}

#
# Open a list of files.
#
# usage: dot::open <file> [<file>]
#
dot::open() {
  (( $# > 0 )) || return

  local cmd

  case "${OSTYPE}" in
    darwin*) cmd="open" ;;
    linux*)  cmd="nohup xdg-open" ;;
    cygwin*) cmd="cygstart" ;;
    *)       cmd="cat" ;;
  esac

  ${cmd} -- "$@" &>/dev/null
}

#
# Edit a list of files in the default editor.
#
# usage: dot::edit [+<line>] <file>
#
dot::edit() {
  (( $# > 0 )) || return

  local editor="${EDITOR:-vim}"

  local files=()
  local line=0

  for opt in "$@"; do
    case "${opt}" in
      +*) line="${opt##+}" ;;
      *)  files+=("${opt}") ;;
    esac
  done

  (( ${#files[@]} > 0 )) || return

  case "${editor}" in
    *vim)
      ${editor} +"${line}" -- "${files[@]}"
      ;;
    atom)
      ${editor} -n -- "${files[0]}:${line}" "${files[@]:1}"
      ;;
    code)
      ${editor} -n -g "${files[0]}:${line}" -- "${files[@]:1}"
      ;;
    *)
      ${editor} -- "${files[@]}"
      ;;
  esac
}

