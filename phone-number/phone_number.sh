#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input="${1//[^0-9]/}"

    ( (( ${#input} < 10 )) || (( ${#input} > 11 )) ) || \
        ( (( ${#input} == 11 )) && ((${input: 0:1} > 1 )) ) || \
        ( (( ${input: -10:1} < 2 )) || (( ${input: -7:1} < 2 )) ) && \
        echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" && exit 1

    echo "${input: -10}"
}

main "$@"
