#!/usr/bin/env bash
set -o errexit
set -o nounset

usage() {
    echo "Usage: ./error_handling <greetee>"
}

main() {
    [[ "$#" -ne 1 ]] && usage && exit 1
    echo "Hello, $1"
}

main "$@"
