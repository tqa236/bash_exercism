#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input="$(echo "${1,,}"| sed -e "s/\b\(.\)/\u\1/g")"
    echo $input | grep -oP '[A-Z]*' | tr -d '\n'
}

main "$@"
