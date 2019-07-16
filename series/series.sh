#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    if [ -z "$1" ]; then
        echo "series cannot be empty" && exit 1
    fi

    number_length=${#1}
    if (( $2 >  number_length )); then
        echo "slice length cannot be greater than series length" && exit 1
    fi

    if (( $2 == 0 )); then
        echo "slice length cannot be zero" && exit 1
    fi

    if (( $2 < 0 )); then
        echo "slice length cannot be negative" && exit 1
    fi

    num_series=$(( number_length - $2 + 1 ))
    for ((i=0; i<num_series; i++)); do
        echo "${1:$i:$2}"
    done

}

main "$@"
