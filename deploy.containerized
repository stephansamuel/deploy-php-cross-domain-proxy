#!/bin/bash

function readConfigJson {
    VALUE=`grep -m 1 "\"${1}\"" config.json | sed -r 's/^ *//;s/.*: *"//;s/",?//'`

    if [ ! "$VALUE" ]; then
        echo "Cannot find \"${1}\" in config.json" >&2;
        exit 1;
    else
        echo $VALUE ;
    fi;
}

