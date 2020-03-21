#!/usr/bin/env bash
set -o errexit
set -o nounset

declare -A allergies=(["eggs"]="1" ["peanuts"]="2" ["shellfish"]="4" ["strawberries"]="8" ["tomatoes"]="16" ["chocolate"]="32" ["pollen"]="64" ["cats"]="128")
allergies_list=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

main() {
    if [[ $2 = "allergic_to" ]]; then
        if (( ($1 & ${allergies[$3]}) == 0 )); then
            echo "false"
        else
            echo "true"
        fi
    fi

    if [[ $2 = "list" ]]; then
        all_allergies=()
        for allergy in "${allergies_list[@]}"; do
            if (( ($1 & ${allergies[$allergy]}) != 0 )); then
                all_allergies+=("$allergy")
            fi
        done
        echo "${all_allergies[@]}"
    fi

}

main "$@"
