#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    [ -z "$1" ] && echo "series cannot be empty" && exit 1

    number_length=${#1}
    (( $2 >  number_length )) &&
        echo "slice length cannot be greater than series length" && exit 1
    (( $2 == 0 )) && echo "slice length cannot be zero" && exit 1
    (( $2 < 0 )) && echo "slice length cannot be negative" && exit 1

    num_series=$(( number_length - $2 + 1 ))
    for ((i=0; i<num_series; i++)); do
        printf "%s" "${1:$i:$2}"
        if (( i < num_series - 1 )); then
            printf " "
        fi
    done
}

main "$@"
