#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local count
    local -l input=$1
    input=${input//[^[:alpha:]]/}
    input="${input,,}"
    count="$(echo "$input" | grep -o . | sort | uniq -i | wc -l)"
    (( count == ${#input} )) && echo "true" || echo "false"
}

main "$@"
