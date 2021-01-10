# shell/node.sh
#
# @file Configuration of the Node environment.


# (1) Node Package Manager ---------------------------------------------- {{{1

export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NPM_CONFIG_DEVDIR="${XDG_CACHE_HOME}/node-gyp"

export NPM_CONFIG_INIT_VERSION="0.0.1"
export NPM_CONFIG_INIT_LICENSE="MIT"


# (2) Node Version Manager ---------------------------------------------- {{{1

export NVM_DIR="${NVM_DIR:-${XDG_DATA_HOME}/nvm}"

if [[ -s "${NVM_DIR}/nvm.sh" ]]; then
  dot::defer "${NVM_DIR}/nvm.sh" nvm node npm ncu svgo
fi


# vim:foldmethod=marker:foldlevel=2
