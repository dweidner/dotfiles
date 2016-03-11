#!/usr/bin/env zsh

# Editor priority list
editors=(vim nano pico)

for editor in $editors; do
  if [[ -x $(which $editor) ]]; then
    EDITOR=$editor
    break
  fi
done

# Warn user about missing editor configuration
if [ -z $EDITOR ]; then
  echo 'dotfiles: No editor set.'
fi

# Set custom editor as default for plaintext files
for ext in txt tex md markdown; do
  alias -s $ext=$EDITOR
done

# Use the open command for media files on Mac OSX
if [[ "$OSTYPE" == darwin* ]]; then
  for ext in mp3 mp4 mov qt mpg mpeg \
             jpg jpeg png gif tif tiff \
             eps ps pdf \
             html html \
             dmg
  do
    alias -s $ext=open
  done
fi
