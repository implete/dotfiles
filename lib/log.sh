#!/usr/bin/env bash
#
# This file contains log functions.

log::heading() {
  if [[ ${QUIET_RUN:-false} == false ]]; then
    local msg=$1
    printf "${color_gray-}${color_bold-}${glyph_star-} %s${color_default-}\n" \
      "$msg"
  fi
}

log::error() {
  local msg=$1
  printf "${color_red-}${glyph_err-} %s${color_default-}\n" "$msg" >&2
}

log::success() {
  local msg=$1
  printf "${color_green-}${glyph_check-} %s${color_default-}\n" "$msg"
}

log::warning() {
  local msg=$1
  printf "${color_yellow-}${glyph_warn-} %s${color_default-}\n" "$msg"
}

log::info() {
  local msg=$1
  printf "${color_blue-}${glyph_info-} %s${color_default-}\n" "$msg"
}

log::note() {
  if [[ ${QUIET_RUN:-false} == false ]]; then
    local msg=$1
    printf "${color_cyan-}${glyph_note-} %s${color_default-}\n" "$msg"
  fi
}

log::fatal() {
  local msg=$1 code=${2-1}
  printf "${color_red-}${color_bold-}${glyph_flag-} %s${color_default-}\n" \
    "$msg"
  exit "$code"
}

__usage_log() {
  local log
  for type in heading \
    error \
    success \
    warning \
    info \
    note; do
    log=log::${type}
    ${log} "${type}"
  done
}

if [[ ${DEBUG_ENABLED:-false} == true ]]; then
  __usage_log
fi
