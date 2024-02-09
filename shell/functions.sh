# shell/functions.sh
#
# @file Utilitiy functions used in interactive shells

#
# Switch to the given directory and list the directory contents.
#
# usage: cdl [<path>]
#
cdl() {
  builtin cd -- "$*" && command ls "${ls_options[@]}"
}

#
# Move a file to the trash.
#
# usage: del <file>
#
del() {
  local dir="${TRASH_DIR:-${HOME}/.Trash}"

  if [[ ! -d "${dir}" ]]; then
    mkdir -p "${dir}"
  fi

  mv "$@" "${dir}"
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
# Get an overview of the current network addresses.
#
# usage: myip
#
myip() {
  printf "\033[0;34m%s\033[0;m\n" "INTERNAL IP:"
  ifconfig | awk '/inet /{ print $2 }' | grep -v "127.0.0.1"

  printf "\033[0;34m\n%s\033[0;m\n" "EXTERNAL IP:"
  dig @resolver1.opendns.com ANY myip.opendns.com +short -4
}

#
# Start a web server on the given local address and port.
#
# usage: serve [<directory>]
serve() {
  php -S localhost:8080 "${1:-.}"
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
