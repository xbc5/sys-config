#!/bin/bash
# This script will link the local config files to files on the system.
# It will mutate the real file system, so ensure that:
# - 1: you use this in an appvm;
# - 2: you only target files that are protected by Qubes COW;
# WARN: this file will DESTROY DATA if you're not careful.

REPO="$(realpath $(dirname $0))"

if ! [[ -e "/run/qubes/this-is-appvm" ]]; then
  echo "Running this script is only make sense in a Qubes AppVM."
  echo "It will modify the root filesystem, which will cause permanent changes."
  echo "DON'T RUN THIS SCRIPT ON A NON-QUBES APPVM"
  exit 1
fi

if ! [[ -f "./.sys-config-repo" ]]; then
  echo "You must run this script inside of the sys-config repo."
  exit 2
fi

if ! [[ -d "${REPO}/$1" ]]; then
  echo "Unknown option: ${1}"
  exit 4
fi

PKG="$1"

shift 1

if (( ${#@} <= 0 )); then
  echo "You must provide file names to link"
fi

SOURCES=$@
for f in $SOURCES; do
  src="${REPO}/${PKG}/${f}" 
  if ! [[ -f "$src" ]]; then
    echo "Source doesn't exist: ${src}"
    exit 5
  fi
done

function create-link() {
  local f="$1"
  local dst_dir="$2"

  local src="${REPO}/${PKG}/${f}" 
  local dst="${dst_dir}/${f}"

  if [[ -L "$dst" ]]; then
    echo "Already a symlink, skipping: $dst"
    return
  fi

  echo "Linking ${PKG}/${f}"

  sudo rm -f "${dst}.sys-config-bak"
  sudo mv "$dst" "${dst}.sys-config-bak"
  sudo ln -s "$src" "$dst"
}

source ./.env
# NOTE: you will probably EDIT BELOW THIS COMMENT.
# NOTE: you must set all of these in ./.env, and keep this list updated.
# These vars point to target directories.
for var in "$__KITTY_CONFIG_DIR"; do
  if [[ -z "${var}" ]]; then
     echo "Missing path variable, you must set all of them in .env."
     echo "See the script for details."
     exit 3
  fi
done

# each PKG corresponds to a directory in repo root: e.g. kitty.
# Use this switch to inject custom config dirs pulled from ./.env.
# Ensure that you validate env vars.
for src in $SOURCES; do
  case $PKG in
    kitty)
      create-link $src "${__KITTY_CONFIG_DIR}"
      ;;
  esac
done
