#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    count="$(echo "${1//[^a-zA-Z]/}" | grep -o . | sort | uniq -i | wc -l)"
    if (( count == 26 )); then echo "true"
    else echo "false"
    fi
}

main "$@"
