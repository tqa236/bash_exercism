#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local target count candidate
    target="$(echo "${1,,}" | grep -o . | sort)"
    count=0
    for word in $2
    do
        candidate="$(echo "${word,,}" | grep -o . | sort)"
        if [ "$target" == "$candidate" ] && [ "${1,,}" != "${word,,}" ] ; then
            (( count > 0 )) && echo -n " "
            echo -n "$word"
            (( count += 1))
        fi
    done
}

main "$@"
