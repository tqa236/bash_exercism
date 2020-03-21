#!/usr/bin/env bash
export BATS_RUN_SKIPPED=true

for path in */; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    cd "$dirname" || exit
    echo "$dirname"
    file_name=${path::-1}
    file_name=${file_name//-/_}
    solution="${file_name}.sh"
    test="${file_name}_test.sh"
    touch "$solution"
    mkdir coverage
    kcov --include-path="./" "./coverage" bats "$test"
    cd ..
done
