#!/bin/bash

CMD=$1
APP_VERSION=$2
TIMESTAMP=$3
NAMESPACE=$4

function print_howto() {
    echo "How to use : pamc CMD APP_VERSION TIMESTAMP NAMESPACE OTHER_PARAM1 OTHER_PARAM2 (eg. pamc update_connect 6.0 201906011030 sunday-stg)"
}

if [ "$CMD" = "" ]; then
    echo -e "CMD cannot be blank"
    print_howto
    exit 1
fi

if [[ $CMD == _* ]]; then
     echo -e "CMD cannot start with _"
    print_howto
    exit 1
fi

if [ "$APP_VERSION" = "" ]; then
    echo -e "APP_VERSION cannot be blank"
    print_howto
    exit 1
fi

if [ "$TIMESTAMP" = "" ]; then
    echo -e "TIMESTAMP cannot be blank"
    print_howto
    exit 1
fi

if [ "$NAMESPACE" == "" ]; then
    echo -e "NAMESPACE cannot be blank"
    print_howto
    exit 1
fi

source ./_scriptx/deploy-base.sh
source ./_scriptx/deploy-metrics.sh

eval ${CMD}