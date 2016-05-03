#!/bin/sh

set -e

if ! command -v vagrant 2>/dev/null
then
  sudo ./setup.sh
fi

eval "$(chef shell-init sh)"
rake $*
