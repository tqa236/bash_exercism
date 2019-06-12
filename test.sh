#!/usr/bin/env bash
for path in */; do
    [ "${path}" == "coverage" ] || continue
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    cd "$dirname" || exit
    file_name=${path::-1}
    file_name=${file_name//-/_}
    solution="${file_name}.sh"
    test="${file_name}_test.sh"
    touch "$solution"
    bats "$test"
    cd ..
done
