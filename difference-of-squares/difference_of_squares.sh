#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    func=$1
    square_of_sum=0
    sum_of_squares=0
    for ((i=0;i<=$2;i++))
    do
        square_of_sum=$((square_of_sum + i))
        sum_of_squares=$((sum_of_squares + i**2))
    done
    square_of_sum=$((square_of_sum**2))
    if [[ "$func" == "square_of_sum" ]]; then
        echo "$square_of_sum"
    fi
    if [[ "$func" == "sum_of_squares" ]]; then
        echo "$sum_of_squares"
    fi
    if [[ "$func" == "difference" ]]; then
        echo "$((square_of_sum - sum_of_squares))"
    fi
}

main "$@"
