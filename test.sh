#!/usr/bin/env bash
for path in */; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    [ "${dirname}" != "coverage" ] || continue
    cd "$dirname" || exit
    echo "$dirname"
    file_name=${path::-1}
    file_name=${file_name//-/_}
    solution="${file_name}.sh"
    test="${file_name}_test.sh"
    touch "$solution"
    bats "$test"
    cd ..
done
