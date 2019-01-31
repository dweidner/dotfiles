# shell/aliases-darwin.sh
#
# @file Mac specific shell aliases.


alias cask="brew cask"                   # Easily install apps via homebrew
alias services="brew services"           # Easily maintain homebrew services
alias reload="source ~/.bash_profile"    # Reload bash configuration

alias vscode="code"                      # Custom alias for VS Code
alias finder="open -a Finder"            # Open a directory in Finder
alias chrome="open -a Google\ Chrome"    # Open a website in Google Chrome
alias firefox="open -a Firefox"          # Open a website in Firefox
alias safari="open -a Safari"            # Open a website in Safari
alias preview="open -a Preview"          # Display a preview of any file
alias ql="qlmanage -p >/dev/null 2>&1"   # Open a file in quick look

alias dce="docker-compose exec"          # Run a command in a given service
alias dcr="docker-compose restart"       # Restart a given service
alias dcu="docker-compose up -d --build" # Build, start and attach to a service
alias dcd="docker-compose down"          # Stop and remove containers
