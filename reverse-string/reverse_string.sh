#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input=$1
    copy=${input}
    len=${#copy}
    rev=""
    for((i=len-1;i>=0;i--)); do rev="$rev${copy:$i:1}"; done

    echo "$rev"
}

main "$@"
