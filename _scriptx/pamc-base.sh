#!/bin/bash

function commit() {
    local IMAGE=$1
    git config user.email "deploy_robot@3dsinteractive.com"
    git config user.name "Deploy Robot"
    git add .
    git commit -m "Release 3dsinteractive/$IMAGE:$NAMESPACE-$APP_VERSION.$TIMESTAMP"
}

function update_connect() {
    alias sed=gsed
    local IMAGE="3dsinteractive\/automation-technology"
    sed -ri "s/$IMAGE:$NAMESPACE-$APP_VERSION.[0-9]+?/$IMAGE:$NAMESPACE-$APP_VERSION.$TIMESTAMP/g" "./$NAMESPACE/app/builds/automation-technology-build.yml"
    commit $IMAGE
}