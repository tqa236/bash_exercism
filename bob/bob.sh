#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
    input="$(echo "${@//\'/}" | xargs)"

    if [ -z "$input" ]; then
        echo "Fine. Be that way!" && exit 0
    fi

    if ([ "${input}" == "${input^^}" ] && [ "${input^^}" != "${input,,}" ]);
        then
            if [ "${input: -1}" == "?" ];
                then echo "Calm down, I know what I'm doing!"
            else
                echo "Whoa, chill out!"
            fi
    else
        if [ "${input: -1}" == "?" ];
            then echo "Sure."
        else
            echo "Whatever."
        fi
    fi
}

main "$@"
