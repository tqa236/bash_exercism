#!/usr/bin/env bash
set -o errexit
set -o nounset


main() {
    local count input
    count=0
    input=$1

    (( input <= 0 )) && echo "Error: Only positive numbers are allowed" && exit 1

    while [[ "$input" -ne 1 ]]
    do
        (( input % 2 == 0 )) && ((input /= 2)) || input=$((3 * input + 1))
        ((count += 1))
    done
    echo "$count"
}

main "$@"
