#!/usr/bin/env bash

# Note: don't bother checking if the input array is
# sorted. Just assume that it is.

@test "finds a value in an array with one element" {
    #skip
    expected=0
    input=(6)
    run bash binary_search.sh 6 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "finds a value in the middle of an array" {
    skip
    expected=3
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 6 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "finds a value at the beginning of an array" {
    skip
    expected=0
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 1 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "finds a value at the end of an array" {
    skip
    expected=6
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 11 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "finds a value in an array of odd length" {
    skip
    expected=9
    input=(1 3 5 8 13 21 34 55 89 144 233 377 634)
    run bash binary_search.sh 144 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "finds a value in an array of even length" {
    skip
    expected=5
    input=(1 3 5 8 13 21 34 55 89 144 233 377)
    run bash binary_search.sh 21 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

# error cases

@test "identifies that a value is not included in the array" {
    skip
    expected="-1"
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 7 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "a value smaller than the array's smallest value is not found" {
    skip
    expected="-1"
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 0 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "a value larger than the array's largest value is not found" {
    skip
    expected="-1"
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 13 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "nothing is found in an empty array" {
    skip
    expected="-1"
    input=()
    run bash binary_search.sh 1 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "nothing is found when the left and right bounds cross" {
    skip
    expected="-1"
    input=(1 2)
    run bash binary_search.sh 0 "${input[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
