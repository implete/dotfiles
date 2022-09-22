#!/usr/bin/env bash
#
# This file contains utility functions.

util::prompt_sudo() {
  log::info "Sudo required."
  if sudo -v; then
    while true; do
      sudo -n true
      sleep 60
      kill -0 "$$" || exit
    done 2>/dev/null &
    log::success "Sudo granted."
  else
    log::fatal "Sudo failed. Exiting."
  fi
}

# shellcheck disable=SC2120
util::prompt_confirm() {
  local reply
  read -r -p "${1:-Continue?} [y/n]: " -n 1 reply
  echo ""
  if [[ $reply =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

util::check_command() {
  command -v "$1" >/dev/null 2>&1
}

util::sym_link() {
  local src=$1 target=$2
  [[ -f $target ]] && mv "${target}" "${target}.old"
  ln -s "${src}" "${target}"
}
