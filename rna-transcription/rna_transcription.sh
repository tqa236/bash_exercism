#!/usr/bin/env bash
set -o errexit
set -o nounset

DNA='CGTA'
RNA='GCAU'

main() {
    rna="${1:-}"

    if [ ! -z "${rna//[ACGT]/}" ]; then
        echo "Invalid nucleotide detected."
        exit 1
    fi

    tr "$DNA" "$RNA"<<<"$rna"
}

main "$@"
