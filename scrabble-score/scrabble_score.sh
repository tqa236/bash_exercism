#!/usr/bin/env bash
set -o errexit
set -o nounset

init_scores() {
    declare i

    for i in {A,E,I,O,U,L,N,R,S,T}; do L_SCORE[$i]=1; done
    for i in {D,G};                 do L_SCORE[$i]=2; done
    for i in {B,C,M,P};             do L_SCORE[$i]=3; done
    for i in {F,H,V,W,Y};           do L_SCORE[$i]=4; done
    for i in {K,};                  do L_SCORE[$i]=5; done
    for i in {J,X};                 do L_SCORE[$i]=8; done
    for i in {Q,Z};                 do L_SCORE[$i]=10; done

    readonly L_SCORE
}

main() {
    declare -A L_SCORE
    init_scores
    input=${1^^}
    score=0

    for ((i=0;i<${#input};i++))
    do
        score=$((score + L_SCORE[${input:$i:1}]))
    done

    echo "$score"
}

main "$@"
