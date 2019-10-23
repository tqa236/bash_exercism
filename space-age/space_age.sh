#!/usr/bin/env bash
set -o errexit
set -o nounset

LC_NUMERIC="en_US.UTF-8"

main() {
    if [ "$1" = "Earth" ]; then
        earth_year=1
    fi
    case "$1" in
        "Earth")
            earth_year=1
            ;;
        "Mercury")
            earth_year=0.2408467
            ;;
        "Venus")
            earth_year=0.61519726
            ;;
        "Mars")
            earth_year=1.8808158
            ;;
        "Jupiter")
            earth_year=11.862615
            ;;
        "Saturn")
            earth_year=29.447498
            ;;
        "Uranus")
            earth_year=84.016846
            ;;
        "Neptune")
            earth_year=164.79132
            ;;
        *)
            echo "not a planet" && exit 1
            ;;
    esac

    echo "scale=3;$2/(31557600 * $earth_year)" | bc | xargs printf "%.*f\\n" 2
}

main "$@"
