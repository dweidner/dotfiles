# shell/aliases-darwin.sh
#
# @file Mac specific shell aliases.


# Delete all .DS_Store files recursively
alias rmds="find . -type f -name .DS_Store -delete"

alias ql="qlmanage -p >/dev/null 2>&1"   # Open a file in quick look

alias hide="chflags hidden"              # Hide a file in Finder
alias show="chflags nohidden"            # Show a file in Finder

alias cask="brew cask"                   # Easily install apps via homebrew
alias services="brew services"           # Easily maintain homebrew services
alias reload="source ~/.bash_profile"    # Reload bash configuration

alias vscode="code"                      # Custom alias for VS Code
alias finder="open -a Finder"            # Open a directory in Finder
alias chrome="open -a Google\ Chrome"    # Open a website in Google Chrome
alias firefox="open -a Firefox"          # Open a website in Firefox
alias safari="open -a Safari"            # Open a website in Safari
alias preview="open -a Preview"          # Display a preview of any file

alias dce="docker-compose exec"          # Run a command in a given service
alias dcl="docker-compose log"           # Display log output of a service
alias dcu="docker-compose up -d --build" # Build, start and attach to a service
alias dcd="docker-compose down"          # Stop and remove containers
