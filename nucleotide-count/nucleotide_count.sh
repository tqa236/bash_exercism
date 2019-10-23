#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    if [ -n "${1//[ACGT]/}" ]; then
        echo "Invalid nucleotide in strand"
        exit 1
    fi

    for nucleotide in A C G T; do
        echo $"$nucleotide: $(echo "$1" | grep -o $nucleotide | wc -l)"
    done
}

main "$@"
