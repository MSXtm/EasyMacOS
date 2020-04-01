#!/bin/bash

# jumpstart.sh: Fetches BaseSystem and converts it to a viable format.
# by MSXtm <admin@msxtm.ir>

TOOLS=$PWD/tools

print_usage() {
    echo
    echo "Usage: $0 [option]"
    echo
    echo "Options:"
    echo " -s, --high-sierra   Fetch High Sierra media."
    echo " -m, --mojave        Fetch Mojave media."
    echo " -c, --catalina      Fetch Catalina media."
    echo
    echo
    echo "          ⚡️ MSXtm"
    echo 
    echo "  - - - - - - - - - - - - - - "
    echo " | github.com/MSXtm/easyMacOS |"
    echo "  - - - - - - - - - - - - - - "
    echo
}

error() {
    local error_message="$*"
    echo "${error_message}" 1>&2;
}

argument="$1"
case $argument in
    -h|--help)
        print_usage
        ;;
    -s|--high-sierra)
        "$TOOLS/FetchMacOS/fetch.sh" -v 10.13 || exit 1;
        ;;
    -m|--mojave)
        "$TOOLS/FetchMacOS/fetch.sh" -v 10.14 || exit 1;
        ;;
    -c|--catalina|*)
        "$TOOLS/FetchMacOS/fetch.sh" -v 10.15 || exit 1;
        ;;
esac

"$TOOLS/dmg2img" "$TOOLS/FetchMacOS/BaseSystem/BaseSystem.dmg" "$PWD/BaseSystem.img"
