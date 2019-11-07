#!/usr/bin/env bash
set -o errexit
set -o nounset

is_valid_triangle(){
    min_num="$(echo "${@}" | xargs -n1 | sort | head -1)"
    max_num="$(echo "${@}" | xargs -n1 | sort | tail -1)"
    sum_num="$(echo "$1 + $2 + $3" | bc)"

    if (( $(echo "$min_num <= 0" |bc -l) )); then
        echo "false"
        exit 0
    fi

    if (( $(echo "$sum_num <= 2 * $max_num" |bc -l) )); then
        echo "false"
        exit 0
    fi
}

main() {
    is_valid_triangle "${@:2}"
    
    type="$1"
    count="$(echo "${@:2}" | xargs -n1 | sort | uniq -i | wc -l)"

    if [ "$type" == "equilateral" ]; then
        if (( count == 1 )); then echo "true"
        else echo "false"
        fi
    fi
    if [ "$type" == "isosceles" ]; then
        if (( count <= 2 )); then echo "true"
        else echo "false"
        fi
    fi
    if [ "$type" == "scalene" ]; then
        if (( count == 3 )); then echo "true"
        else echo "false"
        fi
    fi
}

main "$@"
