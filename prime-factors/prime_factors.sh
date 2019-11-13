#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    declare -a factors
    (( $1 == 1 )) && exit 0
    input="$1"

    while (( input % 2 == 0 ))
    do
        factors+=( "2" )
        input=$(( input / 2 ))
    done

    factor=3
    while (( input >= factor * factor ))
    do
        if (( input % factor == 0 )); then
            factors+=( "$factor" )
            input=$(( input / factor ))
        else
            factor=$(( factor + 2 ))
        fi
    done

    (( input > 1 )) && factors+=( "$input" )

    printf '%s' "${factors[*]}"
}

main "$@"
