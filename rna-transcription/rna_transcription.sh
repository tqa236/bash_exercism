#!/usr/bin/env bash
set -o errexit
set -o nounset

DNA='CGTA'
RNA='GCAU'

main() {
    rna="${1:-}"
    [[ -n "${rna//[ACGT]/}" ]] && echo "Invalid nucleotide detected." && exit 1
    tr "$DNA" "$RNA"<<<"$rna"
}

main "$@"
