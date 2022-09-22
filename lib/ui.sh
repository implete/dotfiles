#!/usr/bin/env bash
#
# This file contains functions related to the user interface.
# Bash v3 compatibility (associative array not suppported)
# shellcheck disable=2034

ui::enable_colors() {
  color_default="\033[0m"
  color_bold="\033[1m"
  color_black="\033[0;30m"
  color_red="\033[0;31m"
  color_green="\033[0;32m"
  color_yellow="\033[0;33m"
  color_blue="\033[0;34m"
  color_magenta="\033[0;35m"
  color_cyan="\033[0;36m"
  color_gray="\033[0;37m"
}

ui::disable_colors() {
  color_default=""
  color_bold=""
  color_black=""
  color_red=""
  color_green=""
  color_yellow=""
  color_blue=""
  color_magenta=""
  color_cyan=""
  color_gray=""
}

if [[ ${COLOR_ENABLED:-true} = true ]] &&
  [[ -t 2 ]] &&
  [[ "${TERM-}" != "dumb" ]]; then
  ui::enable_colors
else
  ui::disable_colors
fi

__usage_colors() {
  local color
  for style in bold \
    black \
    red \
    green \
    yellow \
    blue \
    magenta \
    cyan \
    gray \
    default; do
    color=color_${style}
    printf "${!color}%s " "${style}"
  done
  printf "\n"
}

ui::convert_glyph_to_hex() {
  printf "%s" "$(printf "%s" "$1" | xxd -p -u | sed 's/../\\x&/g')"
}

ui::enable_glyphs() {
  glyph_star="$(ui::convert_glyph_to_hex ★)"
  glyph_err="$(ui::convert_glyph_to_hex ✘)"
  glyph_check="$(ui::convert_glyph_to_hex ✔)"
  glyph_warn="$(ui::convert_glyph_to_hex ⚠)"
  glyph_info="$(ui::convert_glyph_to_hex ➤)"
  glyph_note="$(ui::convert_glyph_to_hex ♦)"
  glyph_flag="$(ui::convert_glyph_to_hex ⚑)"
}

ui::disable_glyphs() {
  glyph_star="*"
  glyph_err="error:"
  glyph_check="success:"
  glyph_warn="warning:"
  glyph_info="info:"
  glyph_note="==>"
  glyph_flag="fatal:"
}

if [[ ${GLYPH_ENABLED:-true} = true ]] &&
  [[ -t 2 ]] &&
  [[ "${TERM-}" != "dumb" ]]; then
  ui::enable_glyphs
else
  ui::disable_glyphs
fi

__usage_glyphs() {
  local glyph
  for type in star \
    err \
    check \
    warn \
    info \
    note \
    flag; do
    glyph=glyph_${type}
    printf "${!glyph} %s " "${type}"
  done
  printf "\n"
}

readonly color_default \
  color_bold \
  color_black \
  color_red \
  color_green \
  color_yellow \
  color_blue \
  color_magenta \
  color_cyan \
  color_gray
readonly glyph_star \
  glyph_info \
  glyph_ok \
  glyph_warn \
  glyph_err

if [[ ${DEBUG_ENABLED:-false} == true ]]; then
  __usage_colors
  __usage_glyphs
fi
