# shell/aliases-darwin.sh
#
# @file Mac specific shell aliases.

alias cdf='cd "$(pfd)"'        # Switch to directory selected in finder
alias puf='pushd "$(pfd)"'     # Push finder directory to the stack

alias hide="chflags hidden"    # Hide a file in Finder
alias show="chflags nohidden"  # Show a file in Finder

alias cask="brew cask"         # Easily install applications via homebrew