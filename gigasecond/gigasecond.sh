#!/usr/bin/env bash
LANG=en_us_8859_1
set -o errexit
set -o nounset

main() {
    date -u -d "$1 + 1000000000 seconds" "+%a %b %-d %T %Z %Y"
}

main "$@"
