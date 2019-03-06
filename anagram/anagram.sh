#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    target="$(echo "${1,,}" | grep -o . | sort)"
    count=0
    for word in $2
    do
        candidate="$(echo "${word,,}" | grep -o . | sort)"
        if [ "$target" == "$candidate" ] && [ "${1,,}" != "${word,,}" ] ; then
            if (( count > 0 )); then
                echo -n " "
            fi
            echo -n "$word"
            count=$(( count + 1))
        fi
    done
}

main "$@"
