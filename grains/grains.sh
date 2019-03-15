#!/usr/bin/env bash
set -o errexit
set -o nounset


main() {
    [ "$1" == "total" ] && bc <<< "2^64 - 1" && exit 0
    (($1 > 64 || $1 < 1)) && echo "Error: invalid input" && exit 1
    bc <<< "2^($1 - 1)"
}

main "$@"
