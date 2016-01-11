#!/usr/bin/env zsh

# Base folder containing all dotfiles
export DOTFILES_PATH=~/.dotfiles

# Customize zsh’s fpath
fpath=( ~/.zfunctions $DOTFILES_PATH/zsh/functions $fpath )

# Customize the path variable
pathdirs=(
  /usr/local/opt/coreutils/libexec/gnubin
  /sbin
  /usr/sbin
  /usr/local/sbin
  /bin
  /usr/bin
  /usr/local/bin
  ~/.gem/bin
  ~/.composer/vendor/bin
  ~/.npm-packages/bin
  $DOTFILES_PATH/bin
  ~/bin
)

for dir in $pathdirs; do
  [ -d $dir ] && path=($dir $path)
done

mandirs=(
  /usr/share/man
  /usr/local/share/man
)

for dir in $mandirs; do
  [ -d $dir ] && manpath=($manpath $dir)
done

typeset -gU path mandirs

# Load custom functions
for file in $DOTFILES_PATH/zsh/functions/*; do
  autoload -Uz ${file##*/}
done

# Load zsh plugins
plugins=( zsh-syntax-highlighting zsh-completions bd )

for plugin in $plugins; do
  plugin_file=$DOTFILES_PATH/zsh/plugins/$plugin/$plugin.plugin.zsh
  [ -f $plugin_file ] && source $plugin_file
done

# Load common shell aliases
source $DOTFILES_PATH/aliases

# Load zsh options
for file in $DOTFILES_PATH/zsh/*.zsh; do
  [ -f $file ] && source $file
done

# Load user configuration
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
