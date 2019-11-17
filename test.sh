#!/usr/bin/env bash
export BATS_RUN_SKIPPED=true

for path in */; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    [[ "${dirname}" != *"markdown"* ]] || continue
    [ "${dirname}" != "coverage" ] || continue # Use for covedev
    cd "$dirname" || exit
    echo "$dirname"
    file_name=${path::-1}
    file_name=${file_name//-/_}
    solution="${file_name}.sh"
    test="${file_name}_test.sh"
    touch "$solution"
    kcov --include-path="./" --bash-method=DEBUG "../coverage" bats "$test"
    # if grep -q "BATS_RUN_SKIPPED" "$test"; then
    #     # echo True
    # else
    #     # echo False
    #     bats "$test"
    # fi

    cd ..
done
