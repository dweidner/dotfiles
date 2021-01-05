# shell/ruby.sh
#
# @file Configuration of the Ruby environment.


# (1) Ruby Configuration ------------------------------------------------ {{{1

if [[ -r "${HOMEBREW_PREFIX}/opt/openssl" ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${HOMEBREW_PREFIX}/opt/openssl"
fi


# (2) Ruby Version Manager ---------------------------------------------- {{{1

export rvm_path="${XDG_DATA_HOME}/rvm"

if [[ -r "${rvm_path}/scripts/rvm" ]]; then
  source "${rvm_path}/scripts/rvm"
fi

if [[ -r "${rvm_path}/scripts/completion" ]]; then
  source "${rvm_path}/scripts/completion"
fi


# (3) Ruby Package Manager ---------------------------------------------- {{{1

export GEMRC="${XDG_CONFIG_HOME}/gem/gemrc"
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"


# (4) Ruby Bundler ------------------------------------------------------ {{{1

export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle"
export BUNDLE_USER_HOME="${XDG_DATA_HOME}/bundle"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle/plugin"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"


# vim:foldmethod=marker:foldlevel=2
