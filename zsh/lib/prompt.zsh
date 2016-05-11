# zsh/lib/prompt.zsh

# Ensure pure is installed via zplug
zplug check "sindresorhus/pure" >/dev/null 2>&1 || return


# PURE: -----------------------------------------
# Pretty, minimal and fast ZSH prompt
# @see <https://github.com/sindresorhus/pure>
# -----------------------------------------------

autoload -U promptinit && promptinit  # Autoload the zsh prompt module
PURE_PROMPT_SYMBOL="$"                # Customize symbol used (default: ❯)
prompt pure                           # Select pure as default theme
