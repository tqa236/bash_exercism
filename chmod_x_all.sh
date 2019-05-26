#!/usr/bin/env bash
# Automatically build all neccessary files for an exercise
for path in */; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    cd "$dirname" || exit
    file_name=${path::-1}
    file_name=${file_name//-/_}
    solution="${file_name}.sh"
    test="${file_name}_test.sh"
    if [ ! -f $solution ]; then
        cp ../template.sh $solution
    fi
    chmod +x "$solution" "$test"
    cd ..
done
