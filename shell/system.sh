# shell/system.sh
#
# @file OS specific environment variables.

case "$OSTYPE" in
  darwin*) source "${DOTFILES}/shell/system-darwin.sh" ;;
  linux*)  source "${DOTFILES}/shell/system-linux.sh" ;;
  bsd*)    source "${DOTFILES}/shell/system-bsd.sh" ;;
esac
