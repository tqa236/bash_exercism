#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local IFS
    IFS=$' \t\n,-'
    read -r -a acronym <<< "${1^^}"
    for i in "${acronym[@]}"
    do
        echo -n "${i:0:1}"
    done
}

main "$@"
