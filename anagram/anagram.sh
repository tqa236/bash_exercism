#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    local target candidate anagrams=()
    target="$(echo "${1,,}" | grep -o . | sort)"
    for word in $2
    do
        candidate="$(echo "${word,,}" | grep -o . | sort)"
        if [ "$target" == "$candidate" ] && [ "${1,,}" != "${word,,}" ] ; then
            anagrams+=( "$word" )
        fi
    done

    echo "${anagrams[*]}"
}

main "$@"
