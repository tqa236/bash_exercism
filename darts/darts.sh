#!/usr/bin/env bash
set -o errexit
set -o nounset

check_num(){
    if [[ ! $1 =~ ^[\-]?[0-9]+([\.][0-9]+)?$ ]]; then
        echo "Usage: ./darts.sh <x> <y>"; exit 1
    fi
}

main() {
    check_num "$1"
    check_num "$2"

    sq_distance=$(bc <<< "$1 * $1 + $2 * $2")
    if (( $(echo "$sq_distance > 100" |bc -l) )); then
        echo "0"
    elif (( $(echo "$sq_distance > 25" |bc -l) )); then
        echo "1"
    elif (( $(echo "$sq_distance > 1" |bc -l) )); then
        echo "5"
    else
        echo "10"
    fi
}

main "$@"
