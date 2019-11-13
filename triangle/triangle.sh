#!/usr/bin/env bash
set -o errexit
set -o nounset

is_valid_triangle(){
    { read -r a; read -r b; read -r c; } < <(printf "%s\n" "$@" | sort -g)
    if ! (( $(echo "$a > 0 && $a + $b > $c" | bc -l) )); then
        echo "false" && exit 0
    fi
}

main() {
    is_valid_triangle "${@:2}"

    type="$1"
    count="$(echo "${@:2}" | xargs -n1 | sort | uniq -i | wc -l)"

    if [ "$type" == "equilateral" ]
    then
        ((count == 1)) && echo true || echo false
    fi

    if [ "$type" == "isosceles" ]
    then
        ((count <= 2)) && echo true || echo false
    fi

    if [ "$type" == "scalene" ]
    then
        ((count == 3)) && echo true || echo false
    fi
}

main "$@"
