#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
  number=$1
  text=""
  if [ $((number%3)) -eq 0 ]; then
    text="${text}Pling"
  fi
  if [ $((number%5)) -eq 0 ]; then
    text="${text}Plang"
  fi
  if [ $((number%7)) -eq 0 ]; then
    text="${text}Plong"
  fi
  if [ -z "$text" ]; then
    echo $number
  else
    echo $text
  fi
}

main "$@"
