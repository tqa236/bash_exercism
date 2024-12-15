#!/bin/bash

reverse_array() {
    local arr=("$@")
    local reversed=()

    for ((i=${#arr[@]}-1; i>=0; i--)); do
        reversed+=("${arr[i]}")
    done

    IFS=','; echo "${reversed[*]}"
}

actions=("wink" "double blink" "close your eyes" "jump")

num=$1

result=()

for i in {0..3}; do
  if (( num & (1 << i) )); then
    result+=("${actions[i]}")
  fi
done

if (( num & 16 )); then
  reverse_array "${result[@]}"
else
  IFS=','; echo "${result[*]}"
fi