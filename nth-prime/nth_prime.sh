#!/usr/bin/env bash
set -o errexit
set -o nounset

is_prime(){
    for prime in "${primes[@]}"; do
        (( prime * prime > $1 )) && echo "true" && return
        ! (( $1 % prime )) && echo "false" && return
    done
    echo "true"
}

main() {
    (( $1 <= 0)) && echo "invalid input" && exit 1
    (( $1 == 1 )) && echo "2" && exit 0
    (( $1 == 2 )) && echo "3" && exit 0
    local number count step
    number=1
    count=3
    step=4
    primes=()
    while (( count <= $1 )); do
        (( number += step ))
        (( step = (step == 2 ? 4 : 2) ))
        result=$(is_prime number)
        [[ $result = "true" ]] && primes+=( "$number" ) && (( count += 1 ))
    done
    echo $number
}

main "$@"
