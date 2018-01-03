# shell/aliases-linux.sh
#
# @file Linux specific shell aliases.


alias reload="source ~/.bashrc"                  # Reload bash configuration

if dot::command_exists "xclip"; then
  alias pbcopy="xclip -selection clipboard"      # Copy to clipboard
  alias pbpaste="xclip -selection clipboard -o"  # Paste from clipboard
fi
