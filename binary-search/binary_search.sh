#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local value=$1
    local array
    IFS=" " read -r -a array <<< "${@:2}"
    local start=0
    local end=${#array[@]}
    while (( start < end)); do
        local middle=$(( (start + end)/2 ))
        local current_value=${array[$middle]}
        (( current_value == value )) && echo $middle && exit 0
        (( current_value < value )) && start=$(( middle + 1 )) || end=$middle
    done
    echo -1
}

main "$@"
