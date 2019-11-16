#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local primes=() tmp=() numbers=()
    mapfile -t numbers < <(seq 2 1 "$1")

    while [[ ${#numbers[@]} -ne 0 ]]; do
        prime="${numbers[0]}"
        primes+=( "$prime" )
        for number in "${numbers[@]}"; do
            (( number % prime != 0 )) && tmp+=( "$number" )
        done
        numbers=("${tmp[@]}")
        tmp=()
    done

    echo "${primes[*]}"

}

main "$@"
