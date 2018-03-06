#!/bin/bash

if [ ! -d "$DATA" ]; then
    mkdir -p $DATA
fi

if [ ! -f $token ]; then
    yandex-disk token --password=$PASSWORD $USER $token
fi

if [ -z "$EXCLUDE" ]; then
    excludedirs=""
else
    excludedirs="--exclude-dirs=$EXCLUDE"
fi

case "$1" in
start)
    yandex-disk start --no-daemon --dir=$DATA --auth=$token ${excludedirs} ${OPTIONS}
    ;;
sync)
    yandex-disk sync --dir=$DATA --auth=$token ${excludedirs} ${OPTIONS}
    ;;
*)
    "$@"
    ;;
esac