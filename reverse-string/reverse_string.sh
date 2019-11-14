#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
  rev=""
  for((i=${#1}-1;i>=0;i--)); do rev+="${1:$i:1}"; done
  echo "$rev"
}

main "$@"
