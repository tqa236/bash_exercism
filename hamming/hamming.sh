#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: hamming.sh <string1> <string2>"
        exit 1
    fi

    if [ ${#1} != ${#2} ]; then
        echo 'left and right strands must be of equal length'
        exit 1
    fi

    count=0
    for ((i=0;i<${#1};i++))
    do
        if test "${1:$i:1}" != "${2:$i:1}"
        then
            count=$((count + 1))
        fi
    done
    echo $count
}

main "$@"
