# shell/aliases-darwin.sh
#
# @file Mac specific shell aliases.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Homebrew
# 2. macOS Applications
# -----------------------------------------------------------------------


# (1) Homebrew ---------------------------------------------------------- {{{1

declare -a keg_only
keg_only=(
  "${HOMEBREW_PREFIX}/opt/curl/bin/curl"
  "${HOMEBREW_PREFIX}/opt/curl-openssl/bin/curl"
)

for cmd in "${keg_only[@]}"; do
  if [[ -x "${cmd}" ]]; then
    alias -- "${cmd##*/}"="${cmd}"
  fi
done



# (2) macOS Applications ------------------------------------------------ {{{1

alias marked="open -a Marked\ 2"         # Custom alias for Marked 2
alias finder="open -a Finder"            # Open a directory in Finder
alias preview="open -a Preview"          # Display a preview of any file
alias chrome="open -a Google\ Chrome"    # Open a website in Google Chrome
alias firefox="open -a Firefox"          # Open a website in Firefox
alias safari="open -a Safari"            # Open a website in Safari

alias ql="qlmanage -p >/dev/null 2>&1"   # Open a file in quick look
alias browser="firefox"                  # Open firefox as default browser
alias vscode="code"                      # Custom alias for VS Code
alias sail="./vendor/bin/sail"           # Run a local copy of Laraval Sail


# vim:foldmethod=marker:foldlevel=2
