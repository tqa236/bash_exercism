#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    IFS=$' \t\n,-'
    acronym=(${1^^})
    for i in "${acronym[@]}"
    do
        echo -n "${i:0:1}"
    done
}

main "$@"
