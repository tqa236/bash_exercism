#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
  # Check number of inputs
  if [ "$#" -ne 1 ]; then
    echo "Usage: leap.sh <year>"
    exit 1
  fi
  input=$1

  # Verify that input is integer
  if [[ -n ${input//[0-9]/} ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
  fi

  # Check if the year is leap year
  if ! [ $((input%4)) -eq 0 ]; then
     echo "false"
  elif [ $((input%100)) -eq 0 ] && [ $((input%400)) -ne 0 ]; then
     echo "false"
  else
     echo "true"
  fi


}

main "$@"
