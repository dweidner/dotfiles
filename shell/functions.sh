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
  builtin cd -- "$*" && command ls "${ls_options[@]}"
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
# Load a given file to the ~/Downloads folder.
#
# usage: download <url>
#
download() {
  local user_agent="${CURL_USER_AGENT:-Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:70.0) Gecko/20100101 Firefox/70.0}"
  local target_dir="${XDG_DOWNLOAD_DIR:-${HOME}/Downloads}"

  wget \
    --directory-prefix="${target_dir}" \
    --user-agent="${user_agent}" \
    --random-wait \
    --no-verbose \
    --show-progress \
    --continue \
    --content-disposition \
    --xattr \
    "$@"
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
