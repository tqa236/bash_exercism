#!/usr/bin/env bash
set -o errexit
set -o nounset

declare -A allergies=(["eggs"]="1" ["peanuts"]="2" ["shellfish"]="4"
                      ["strawberries"]="8" ["tomatoes"]="16"
                      ["chocolate"]="32" ["pollen"]="64" ["cats"]="128")
allergies_list=("eggs" "peanuts" "shellfish" "strawberries"
                "tomatoes" "chocolate" "pollen" "cats")

allergic_to () {
    if (( ($1 & $2) == 0 )); then
        echo "false"
    else
        echo "true"
    fi
}

main() {
    [[ $2 = "allergic_to" ]] && allergic_to "$1" "${allergies[$3]}"

    if [[ $2 = "list" ]]; then
        all_allergies=()
        for allergy in "${allergies_list[@]}"; do
            # shellcheck disable=SC2091
            $(allergic_to "$1" "${allergies[$allergy]}" ) && all_allergies+=("$allergy")
        done
        echo "${all_allergies[@]}"
    fi

}

main "$@"
