#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
  [[ "$#" -ne 1 ]] && echo "Usage: leap.sh <year>" && exit 1

  input=$1
  [[ -n ${input//[0-9]/} ]] && echo "Usage: leap.sh <year>" && exit 1

  [[ $((input%4)) -ne 0 || $((input%100)) -eq 0 &&  $((input%400)) -ne 0 ]] &&
  echo "false" || echo "true"

}

main "$@"
