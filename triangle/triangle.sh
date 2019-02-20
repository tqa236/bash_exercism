#!/usr/bin/env bash
set -o errexit
set -o nounset

is_valid_triangle(){
    min_side="$(echo "${@}" | xargs -n1 | sort | head -1)"
    max_side="$(echo "${@}" | xargs -n1 | sort | tail -1)"
    sum_side="$(echo "$1 + $2 + $3" | bc)"

    (( $(echo "$min_side <= 0" |bc -l) )) && echo "false" && exit 0

    if (( $(echo "$sum_side <= 2 * $max_side" | bc -l) )); then
        echo "false" && exit 0
    fi
}

main() {
    is_valid_triangle "${@:2}"

    local count
    count="$(echo "${@:2}" | xargs -n1 | sort | uniq -i | wc -l)"

    case "$1" in
        equilateral) (( count == 1 )) && echo "true" && exit 0;;
        isosceles) (( count <= 2 )) && echo "true" && exit 0;;
        scalene) (( count == 3 )) && echo "true" && exit 0;;
    esac

    echo "false"
}

main "$@"
