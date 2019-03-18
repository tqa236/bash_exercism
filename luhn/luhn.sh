#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    reverse_input="$(echo "${1// /}"|rev)"

    [[ "$reverse_input" == "0" ]] && echo "false" && exit 0
    [[ "${reverse_input//[0-9]/}" != "" ]] && echo "false" && exit 0

    sum=0
    for ((i=0;i<${#reverse_input};i++))
    do
        digit=${reverse_input:$i:1}
        if ((i % 2 == 0)); then
            sum=$(( sum + digit ))
        else
            sum=$(( sum + digit * 2 - 9 * (digit / 5) ))
        fi
    done

    if ((sum % 10 == 0)); then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
