# shell/utilities.sh
#
# @file Some utility functions used throughout the dotfiles.


#
# Print a status message.
#
# usage: dot::info <message>
#
dot::info() {
  echo -e "\033[0;34m==> $*\033[0;m"
}

#
# Print a message after a successfull operation.
#
# usage: dot::ok <message>
#
dot::ok() {
  echo -e "\033[0;32m==> $*\033[0;m"
}

#
# Print a warning message.
#
# usage: dot::warning <message>
#
dot::warning() {
  echo -e "\033[0;33m==> $*\033[0;m" >&2
}

#
# Print an error message.
#
# usage: dot::error <message>
#
dot::error() {
  echo -e "\033[0;31m==> $*\033[0;m" >&2
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
