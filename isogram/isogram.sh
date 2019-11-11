#!/usr/bin/env bash
set -o errexit
set -o nounset

LC_ALL=en_US.utf8

main() {
    local input
    local count
    input="${1//[^a-zA-Z]/}"
    count="$(echo "$input" | grep -o . | sort | uniq -i | wc -l)"
    (( count == ${#input} )) && echo "true" || echo "false"
}

main "$@"
