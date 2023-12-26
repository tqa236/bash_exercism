#!/usr/bin/env bash
set -o errexit
set -o nounset
set -f     

main() {

    local IFS=" -"
    acronym=(${1^^})
    
    for word in "${acronym[@]}"
    do
        word=${word//[[:punct:]]/}
        echo -n "${word:0:1}"
    done
}

main "$@"