# shell/ruby.sh
#
# @file Configuration of the Ruby environment.


export RVM_PATH="${XDG_DATA_HOME}/rvm"

if [[ -r "${HOMEBREW_PREFIX}/opt/openssl" ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${HOMEBREW_PREFIX}/opt/openssl"
fi

if [[ -r "${RVM_PATH}/scripts/rvm" ]]; then
  source "${RVM_PATH}/scripts/rvm"
fi

if [[ -r "${RVM_PATH}/scripts/completion" ]]; then
  source "${RVM_PATH}/scripts/completion"
fi

# vim:foldmethod=marker:foldlevel=2
