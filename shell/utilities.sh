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
# Determine wheter a given value exists in an array
#
# usage: dot::in_array <needle> <array>
#
dot::in_array() {
  local needle="$1"
  local item

  shift

  for item; do
    if [[ "$needle" == "$item" ]]; then
      return 0
    fi
  done

  return 1
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
# Generate a heading text.
#
# usage: dot::heading <heading> [<character>]
#
dot::heading() {
  local heading
  local hr

  heading="$(echo "${1}" | tr "[:lower:]" "[:upper:]")"
  hr="$(dot::hr $(( ${#heading} + 1 )))"

  echo -e "\033[0;34m${heading} ${hr}\033[0;m"
}

#
# Draw a horizontal line.
#
# usage: dot::hr [<offset>] [<char>]
#
dot::hr() {
  local offset="${1:-0}"
  local char="${2:-─}"

  printf "%*s" $(( COLUMNS - offset )) " " | tr " " "${char}"
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
# Print an error message and stop script execution.
#
# usage: dot::exit <message>
#
dot::exit() {
  dot::error "$@"
  exit 1
}

#
# Remove a single characters from the beginning and end of the given string.
#
# usage: dot::trim <str> [<char>]
#
dot::trim() {
  local str="$1"
  local needle="${2:- }"

  str="${str#$needle}"
  str="${str%$needle}"

  echo "$str"
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
