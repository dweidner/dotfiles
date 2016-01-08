#!/usr/bin/env bash

# Avoid loading dotfiles for non-interactive shells
[ -z "$PS1" ] && return

# Base folder containing all dotfiles
export DOTFILES_PATH=~/.dotfiles

# Load common shell aliases
source $DOTFILES_PATH/aliases

# Customize the bash shell
source $DOTFILES_PATH/bash/options.sh
source $DOTFILES_PATH/bash/prompt.sh

