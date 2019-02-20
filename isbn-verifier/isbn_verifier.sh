#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    date -u -d "$1 + 1000000000 seconds" "+%a %b %-d %T %Z %Y"
}

main "$@"
