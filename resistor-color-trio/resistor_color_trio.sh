#!/usr/bin/env bash
set -o errexit
set -o nounset

declare -A registor_colors=(["black"]="0" ["brown"]="1" ["red"]="2"
                            ["orange"]="3" ["yellow"]="4" ["green"]="5"
                            ["blue"]="6" ["violet"]="7" ["grey"]="8" ["white"]="9")

declare -A prefixes=(["0"]="" ["1"]="kilo" ["2"]="mega" ["3"]="giga")

convert() {
    if [[ ${1+x} ]]; then
        echo "${registor_colors[$1]}"
    else
        exit 1
    fi
}

main() {
    value=$(convert "$1")
    value=$(( 10 * value + $(convert "$2") ))
    num_zeros=$( convert "$3" )
    if (( value > 0 )) && (( value % 10 == 0 )); then
        value=$(( value/10 ))
        num_zeros=$(( num_zeros +1 ))
    fi
    prefix=${prefixes[$(( num_zeros / 3 ))]}
    value=$(( value * 10 ** (num_zeros % 3) ))
    echo "$value ${prefix}ohms"
}

main "$@"
