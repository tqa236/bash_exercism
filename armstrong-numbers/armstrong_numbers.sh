#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input=$1
    len=${#input}
    value=0
    while [[ "$input" -ne 0 ]]
    do
        value=$((value + (input%10)**len))
        input=$((input/10))
    done
    if (("$1" == "$value")); then echo "true"
    else echo "false"
    fi
}

main "$@"
