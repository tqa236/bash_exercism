#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    number=$1
    text=""
    if ((number%3 == 0)); then
        text+="Pling"
    fi
    if ((number%5 == 0)); then
        text+="Plang"
    fi
    if ((number%7 == 0)); then
        text+="Plong"
    fi
    if [ -z "$text" ]; then
        echo "$number"
    else
        echo "$text"
    fi
}

main "$@"
