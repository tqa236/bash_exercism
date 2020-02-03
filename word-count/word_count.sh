#!/usr/bin/env bash
set -o errexit
set -o nounset

print_words(){
    for word in $1
    do
        word=${word#\'}
        word=${word%\'}
        word=${word//\\n/}
        echo "$word"
    done
}

main() {
    clean_input=${1//[^[:alnum:]\'\\]/ }
    print_words "${clean_input,,}" | sort | uniq -c | awk '{ print $2 ": " $1}'
}

main "$@"
