#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: error_handling.sh <person>"
    exit 1
  elif [ "$#" -ne 1 ]; then
    echo "Usage: error_handling.sh <person>"
    exit 1
  fi
  echo "Hello, $1"
}

main "$@"
