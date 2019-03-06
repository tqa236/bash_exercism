#!/usr/bin/env bash
set -o errexit
set -o nounset

is_silence(){
    [ -z "$input" ]
}

is_yelling(){
    [ "${input}" == "${input^^}" ] && [ "${input^^}" != "${input,,}" ]
}

is_question(){
    [ "${input: -1}" == "?" ]
}

main() {
    input="$(echo "${@//\'/}" | xargs)"

    if is_silence; then
        echo "Fine. Be that way!"
    elif is_yelling && is_question; then
        echo "Calm down, I know what I'm doing!"
    elif is_yelling; then
        echo "Whoa, chill out!"
    elif is_question; then
        echo "Sure."
    else
        echo "Whatever."
    fi

}

main "$@"
