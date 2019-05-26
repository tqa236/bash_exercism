#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    echo "obase=$3;$2" | bc
}

main "$@"
