#!/usr/bin/env bash
set -o errexit
set -o nounset

is_valid_triangle(){
    { read -r a; read -r b; read -r c; } < <(printf "%s\n" "$@" | sort -g)
    (( $(echo "$a > 0 && $a + $b > $c" | bc -l) ))
}

main() {
    ! is_valid_triangle "${@:2}" && echo "false" && exit 0
    
    type="$1"
    count="$(echo "${@:2}" | xargs -n1 | sort | uniq -i | wc -l)"

    case "$type" in
        "equilateral" ) ((count == 1)) && echo true || echo false ;;
        "isosceles" )   ((count <= 2)) && echo true || echo false ;;
        "scalene" )     ((count == 3)) && echo true || echo false ;;
    esac
}

main "$@"
