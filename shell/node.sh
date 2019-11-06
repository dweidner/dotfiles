# shell/node.sh
#
# @file Configuration of the Node environment.


# (1) Node Package Manager ---------------------------------------------- {{{1

if [[ -r "${XDG_CONFIG_HOME}/npm/npmrc" ]]; then
  export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
fi

export NPM_CONFIG_INIT_VERSION="0.0.1"
export NPM_CONFIG_INIT_LICENSE="MIT"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"


# (2) Node Version Manager ---------------------------------------------- {{{1

export NVM_DIR="${XDG_DATA_HOME}/nvm"

if [[ -r "${NVM_DIR}/nvm.sh" ]]; then
  source "${NVM_DIR}/nvm.sh"
fi

if [[ -n "${BASH}" ]] && [[ -r "${NVM_DIR}/bash_completion" ]]; then
  source "${NVM_DIR}/bash_completion"
fi


# vim:foldmethod=marker:foldlevel=2
