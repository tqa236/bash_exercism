#!/usr/bin/env bash
set -o errexit
set -o nounset

chr() {
    (( $1 != 256 )) || return 1
    # shellcheck disable=SC2059
    printf "\\$(printf '%03o' "$1")"
}

ord() {
    LC_CTYPE=C printf '%d' "'$1"
}

main() {
    plain_text="${2//[^[:alnum:]]/}"
    plain_text="${plain_text,,}"
    encoded_text=""
    text_length=${#plain_text}

    for((i=0;i<${#plain_text};i++)); do
        index=$(ord "${plain_text:$i:1}")
        if (( index >= 97 )) && (( index <= 122 )); then
            new_index=$(( 219 - index ))
            encoded_char=$(chr "$new_index")
        else
            encoded_char="${plain_text:$i:1}"
        fi

        encoded_text+="$encoded_char"

        if (( i % 5 == 4 )) && (( i < text_length - 1 )) && [[ "$1" == "encode" ]]; then
            encoded_text+=" "
        fi
    done

    echo "$encoded_text"
}

main "$@"
