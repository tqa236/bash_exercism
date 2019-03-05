#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input="${1//[^a-zA-Z]/}"
    count="$(echo "$input" | grep -o . | sort | uniq -i | wc -l)"
    if (( count == ${#input} )); then echo "true"
    else echo "false"
    fi
}

main "$@"
