#!/usr/bin/env bash
set -o errexit
set -o nounset


main() {
    count=0
    input=$1

    (( input <= 0 )) \
        && echo "Error: Only positive numbers are allowed" \
        && exit 1

    while [[ "$input" -ne 1 ]]
    do
        if (( input % 2 == 0 )); then
            input=$((input/2))
        else
            input=$((3 * input + 1))
        fi
        count=$((count + 1))
    done
    echo "$count"
}

main "$@"
