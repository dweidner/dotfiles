#!/usr/bin/env zsh

#
# Load directory colors using the dircolors utility. Uses solarized
# LSCOLORS on Mac OSX if dircolors is not available.
#
# Usage: load_dircolors
#
load_dircolors() {

  # Test for availability of the dircolors utility
  local cmd

  if type dircolors >/dev/null 2>&1; then
    cmd="dircolors"
  elif type gdircolors >/dev/null 2>&1; then
    cmd="gdircolors"
  fi

  # Use LSCOLORS on Mac OSX without gnu ls
  if [[ "$OSTYPE" == darwin* ]]; then
    if ! type gls >/dev/null 2>&1; then
      export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
      return 0
    fi
  fi

  # Use the dircolor utility to export the LS_COLORS variable
  if [ -n "$cmd" ]; then
    [ -r ~/.dircolors ] && eval "$($cmd -b ~/.dircolors)" || eval "$($cmd -b)"
    return 0
  fi

  return 1

}

load_dircolors
