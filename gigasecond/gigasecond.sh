#!/usr/bin/env bash
LANG=en_us_8859_1
set -o errexit
set -o nounset

main() {
    date -u -d "$1Z +1000000000 second" "+%Y-%m-%dT%H:%M:%S"
}

main "$@"
