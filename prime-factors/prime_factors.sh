#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local factors=() factor input
    (( $1 == 1 )) && exit 0
    input="$1"
    factor=2

    while (( input >= factor * factor ))
    do
        if (( input % factor == 0 )); then
            factors+=( "$factor" )
            (( input /= factor ))
        else
            (( factor += (factor == 2 ? 1 : 2) ))
        fi
    done

    (( input > 1 )) && factors+=( "$input" )
    echo "${factors[*]}"
}

main "$@"
