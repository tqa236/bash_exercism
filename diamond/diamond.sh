#!/usr/bin/env bash
set -o errexit
set -o nounset

# chr() {
#   [ "$1" -lt 256 ] || return 1
#   printf "\\$(printf '%03o' "$1")"
# }

ord() {
    LC_CTYPE=C printf '%d' "'$1"
}

make_row(){
    echo ""
}

main() {
    echo "A"
}

main "$@"
