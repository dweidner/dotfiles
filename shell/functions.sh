# shell/functions.sh
#
# @file Utilitiy functions used in interactive shells

#
# Switch to the given directory and list the directory contents.
#
# usage: cdl [<path>]
#
cdl() {
  if (( $# == 0 )); then
    cd || return 1
  else
    cd -- "$*" || return 1
  fi

  ls "${ls_options[@]:-}"
}

#
# Copy files from one location to another using rsync.
# 
# usage: cpv <source> <target>
#
cpv() {
  rsync --archive --progress --partial --human-readable "${@}"
}

#
# Create and switch to a given directory.
#
# usage: mcd [<path>]
#
mcd() {
  if (( $# == 0 )); then
    return 1
  fi

  if [[ ! -d "${1}" ]]; then
    mkdir -p "${1}" || return 1
  fi

  cd "${1}" || return 1
}

#
# Find files whose name matches a given pattern.
#
# usage: ff <pattern>
#
ff() {
  find . -type f -iname '*'"$*"'*' -exec ls "${ls_options[@]:-}" -- {} \;
}

#
# Get an overview of the current network addresses.
#
# usage: ip
#
ip() {
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
# Display the weather for a given city.
#
# usage: weather [<city>]
#
weather() {
  curl "wttr.in/~${1:-Bremen}"
}
