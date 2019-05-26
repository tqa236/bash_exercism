#!/usr/bin/env bash
set -o errexit
set -o nounset

chr() {
  [ "$1" -lt 256 ] || return 1
  # shellcheck disable=SC2059
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

encode(){
    plain_text="${1//[^a-zA-Z0-9]/}"
    plain_text="${plain_text,,}"
    encoded_text=""

    for((i=0;i<${#plain_text};i++)); do
        index=$(ord "${plain_text:$i:1}")
        if (( index >= 97 )) && (( index <= 122 )); then
            new_index=$(( 219 - index ))
            encoded_char=$(chr "$new_index")
        else
            encoded_char="${plain_text:$i:1}"
        fi
        encoded_text="$encoded_text$encoded_char"
    done
    echo "${encoded_text}"
}

main() {
    if [[ "$1" == "encode" ]]; then
        encode "$2" | sed 's/.\{5\}/& /g' | sed -e 's/[[:space:]]*$//'
    fi

    if [[ "$1" == "decode" ]]; then
        encode "$2"
    fi
}

main "$@"
