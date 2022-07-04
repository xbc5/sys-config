#!/bin/bash

if (( ${#@} < 5 )); then
  echo "You must provide version, font, font-type, and file name:"
  echo "  e.g. `basename $0` '${HOME}/.local/share/fonts' '2.1.0' 'DejaVuSansMono' 'Regular' 'DejaVu Sans Mono Nerd Font Complete Mono.ttf'"
  echo "Look at the patched-fonts in the nerd-font repository for clues." 
  exit 1
fi

function build_url() {
  local ver="$1"
  local font="$2"
  local type="$3"
  shift 3
  local filename="`echo ${@} | sed 's/  */%20/g'`"
  local base="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${ver}/patched-fonts/"
  echo "${base}/${font}/${type}/complete/${filename}"
}

out="$1"
url="`build_url $2 $3 $4 $5`"
curl --tlsv1.3 --location --silent --show-error --output "${out}/$5" "$url"

