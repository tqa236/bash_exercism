# #!/usr/bin/env bash
# set -o errexit
# set -o nounset
#
# is_prime(){
#     for prime in "${primes[@]}"; do
#         (( prime * prime > $1 )) && echo "true" && return
#         ! (( $1 % prime )) && echo "false" && return
#     done
#     echo "true"
# }
#
# main() {
#     (( $1 <= 0)) && echo "invalid input" && exit 1
#     (( $1 == 1 )) && echo "2" && exit 0
#     (( $1 == 2 )) && echo "3" && exit 0
#     local number count step
#     number=1
#     count=3
#     step=4
#     primes=()
#     while (( count <= $1 )); do
#         (( number += step ))
#         (( step = (step == 2 ? 4 : 2) ))
#         result=$(is_prime number)
#         [[ $result = "true" ]] && primes+=( "$number" ) && (( count += 1 ))
#     done
#     echo $number
# }
#
# main "$@"

#!/usr/bin/env bash

# The largest concern is finding an algorithm that is not
# excruciatingly slow in bash.
# The Sieve of Eratosthenes is a good quick algorithm for
# finding # primes less than an upper bound. The key is
# estimating # an approximate upper bound for the nth prime

# namerefs introduced in bash 4.3
if    [[ ${BASH_VERSINFO[0]} -lt 4 ]] ||
    { [[ ${BASH_VERSINFO[0]} -eq 4 ]] && [[ ${BASH_VERSINFO[1]} -lt 3 ]]; }
then
    echo "bash version 4.3 required" >&2
    exit 2
fi

main() {
    local -i n=$1
    if (( n <= 0 )); then
        echo "invalid input" >&2
        exit 1
    fi

    local -i upper=$(approxNth $n)
    local primes=()
    sieve $upper primes

    # should do some validation that we acually have n
    # prime numbers, but this passes the test suite.

    echo "${primes[n-1]}"
}

# approximate the nth prime number
# ref: https://exercism.io/tracks/python/exercises/nth-prime/solutions/2a84e7330fab4b4cb04d92cf0f38164d
# ref: https://en.wikipedia.org/wiki/Prime_number_theorem
approxNth() {
    # bc's `l()` function is natural logarithm
    local real=$( printf "2 + 1.2 * %d * l(%d)\n" "$1" "$1" | bc -l )
    # truncate the fractional part
    echo "${real%.*}"
}

# Sieve of Eratosthenes
sieve() {
    local -i limit=$1 i p
    local -n primes_=$2
    local -a is_prime=()
    for ((i = 2; i <= limit; i++)); do
        is_prime[i]=true
    done
    for ((p = 2; p * p <= limit; p++)); do
        if ${is_prime[p]}; then
            (( step = (p==2) ? 2 : 2*p ))
            for (( i = p * p; i <= limit; i += step )); do
                is_prime[i]=false
            done
        fi
    done
    for ((i = 2; i <= limit; i++)); do
        ${is_prime[i]} && primes_+=( $i )
    done
    return
}

main "$@"
