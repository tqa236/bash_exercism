#!/usr/bin/env bash
set -o errexit
set -o nounset

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

main() {
    input=${1,,}
    values=(1 3 3 2 1 4 2 4 1 8 5 1 3 1 1 3 10 1 1 1 1 4 4 8 4 10)
    score=0

    for ((i=0;i<${#input};i++))
    do
        value="$(ord "${input:$i:1}")"
        value=$((value - 97))
        score=$((score + values[value]))
    done

    echo "$score"
}

main "$@"
