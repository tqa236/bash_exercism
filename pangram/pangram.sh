#!/usr/bin/env bash
set -o errexit
set -o nounset

print_characters(){
    for ((i=0;i<${#1};i++))
    do
      echo "${1:$i:1}"
    done
}

main() {
    count="$(print_characters "${1//[^a-zA-Z]/}" | sort | uniq -i | wc -l)"
    if (( count == 26 )); then echo "true"
    else echo "false"
    fi
}

main "$@"
