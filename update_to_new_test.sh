#!/usr/bin/env bash

for path in */; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    cd "$dirname" || exit
    echo "$dirname"
    file_name=${path::-1}
    file_name=${file_name//-/_}
    test="${file_name}_test.sh"
    command="exercism download --track=bash --exercise=${file_name} --force"
    rm $test
    exercism download --track=bash --exercise="${file_name}" --force    
    cd ..
done
