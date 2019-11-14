#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    square_of_sum=0
    sum_of_squares=0
    for ((i=0;i<=$2;i++))
    do
        square_of_sum=$((square_of_sum + i))
        sum_of_squares=$((sum_of_squares + i**2))
    done
    square_of_sum=$((square_of_sum**2))
    [[ "$1" == "square_of_sum" ]] && echo "$square_of_sum" && exit 0
    [[ "$1" == "sum_of_squares" ]] && echo "$sum_of_squares" && exit 0
    [[ "$1" == "difference" ]] && echo "$((square_of_sum - sum_of_squares))"
}

main "$@"
