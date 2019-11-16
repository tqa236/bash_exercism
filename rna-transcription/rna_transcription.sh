#!/usr/bin/env bash
set -o errexit
set -o nounset

DNA='CGTA'
RNA='GCAU'

main() {
    local dna
    dna="${1:-}"
    [[ $dna == *[^$DNA]* ]] && echo "Invalid nucleotide detected." && exit 1
    tr "$DNA" "$RNA"<<<"$dna"
}

main "$@"
