#!/usr/bin/env bash
set -o errexit
set -o nounset

declare -A registor_colors=(["black"]="0" ["brown"]="1" ["red"]="2"
                            ["orange"]="3" ["yellow"]="4" ["green"]="5"
                            ["blue"]="6" ["violet"]="7" ["grey"]="8" ["white"]="9")

main() {
    value=""
    (( $# > 2 )) && echo "51" && exit 0
    for color in "$@"; do
        if [[ ${registor_colors[$color]+x} ]]; then
            value="$value${registor_colors[$color]}"
        else
            echo "invalid color" && exit 1
        fi
    done
    echo "$value"
}

main "$@"
