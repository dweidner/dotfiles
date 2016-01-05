#!/usr/bin/env bash

#
# Test whether the current operating system is a version of Mac OSX.
#
is_mac() {
  [[ "$OSTYPE" == darwin* ]]
}

#
# Test whether the given value is empy/null.
#
# Usage: is_empty value
#
# $1 = Value to test
#
is_empty() {
  [ -z "$1" ]
}

#
# Test whether the given path points to a valid directory.
#
# Usage: is_dir path
#
# $1 = Path of the directory
#
is_dir() {
  [ -d "$1" ]
}

#
# Test whether the given path points to a valid file.
#
# Usage: is_file path
#
# $1 = Path to the file
#
is_file() {
  [ -f "$1" ]
}

#
# Test whether the given value is a number.
#
# is_number value
#
# $1 = Value to test
#
is_number() {
  [[ $1 =~ ^[0-9]+$ ]]
}

#
# Test whether the given command can be executed.
#
# Usage: is_executable command
#
# $1 = Name of the command to execute
#
is_executable() {
  type "$1" >/dev/null 2>&1
}

#
# Run a given command if it is executable.
#
# Usage: execute_if_exists command
#
# $1 = Name of the command to execute
#
execute_if_exists() {
  if is_executable "$1"; then
    $1
    return $?
  fi

  return 1
}
