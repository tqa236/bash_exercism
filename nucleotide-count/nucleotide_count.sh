#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    [[ -n "${1//[ACGT]/}" ]] && echo "Invalid nucleotide in strand" && exit 1
    declare -A count

    for nucleotide in A C G T; do
        count[$nucleotide]=0
    done

    for (( i=0; i<${#1}; i++ )); do
        (( count[${1:$i:1}] += 1 ))
    done

    for nucleotide in A C G T; do
        # echo $"$nucleotide: $(echo "$1" | grep -o $nucleotide | wc -l)"
        echo $"$nucleotide: ${count[$nucleotide]}"
    done
}

main "$@"
