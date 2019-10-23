#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    digits="${1//[^0-9]/}"
    { [ ${#digits} != 9 ] && [ ${#digits} != 10 ]; } && echo "false" && exit 0

    check=0
    if [ ${#digits} == 9 ]; then
        if [ "${1: -1:1}" == "X" ]; then
            check=$((check + 10))
        else
            echo "false" && exit 0
        fi
    fi

    for ((i=0;i<${#digits};i++))
    do
        check=$((check + ${digits:$i:1} * (10 - i)))
    done
    (( check%11 == 0 )) && echo "true" && exit 0
    echo "false"
}

main "$@"
