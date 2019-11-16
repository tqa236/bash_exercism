#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local square_of_sum=0
    local sum_of_squares=0
    for ((i=1;i<=$2;i++))
    do
        ((square_of_sum += i))
        ((sum_of_squares += i**2))
    done
    ((square_of_sum *= square_of_sum))
    case "$1" in
        "square_of_sum" ) echo "$square_of_sum" ;;
        "sum_of_squares" ) echo "$sum_of_squares" ;;
        "difference" ) echo "$((square_of_sum - sum_of_squares))" ;;
    esac
}

main "$@"
