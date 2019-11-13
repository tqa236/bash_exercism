#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local input
    local count
    input="${1//[^a-zA-Z]/}"
    input="${input,,}"
    count="$(echo "$input" | grep -o . | sort | uniq -i | wc -l)"
    (( count == ${#input} )) && echo "true" || echo "false"
}

main "$@"
