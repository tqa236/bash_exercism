#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    value=$1
    IFS=" " read -r -a array <<< "${@:2}"
    start=0
    end=${#array[@]}
    while (( start < end)); do
        middle=$(( (start + end)/2 ))
        current_value=${array[$middle]}
        (( current_value == value )) && echo $middle && exit 0
        (( current_value < value )) && start=$(( middle + 1 )) || end=$middle
    done
    echo -1
}

main "$@"
