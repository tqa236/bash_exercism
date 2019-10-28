#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    digits="${1//[^0-9]/}"
    [[ ${#digits} -ne 9 && ${#digits} -ne 10 ]] && echo "false" && exit 0

    check=0
    if [[ ${#digits} -eq 9 ]]; then
        if [[ "${1: -1:1}" == "X" ]]; then
            ((check += 10))
        else
            echo "false" && exit 0
        fi
    fi

    for ((i=0;i<${#digits};i++))
    do
        ((check += ${digits:$i:1} * (10 - i)))
    done
    (( check%11 == 0 )) && echo "true" || echo "false"
}

main "$@"
