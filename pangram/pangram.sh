#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input=${1,,}

    for char in {a..z}
    do
        if [[ $input != *$char* ]]; then
            echo "false"
            exit 0
        fi
    done
    echo "true"
    
    # count="$(echo "${1//[^a-zA-Z]/}" | grep -o . | sort | uniq -i | wc -l)"
    # if (( count == 26 )); then echo "true"
    # else echo "false"
    # fi
}

main "$@"
