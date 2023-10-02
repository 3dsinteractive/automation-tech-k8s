
function update_node_daemon() {
    alias sed=gsed
    local IMAGE="3dsinteractive\/automation-technology"
    sed -ri "s/$IMAGE:$NAMESPACE-$APP_VERSION.[0-9]+?/$IMAGE:$NAMESPACE-$APP_VERSION.$TIMESTAMP/g" "./$NAMESPACE/app/builds/node-daemon-build.yml"
    commit $IMAGE
}

function update_metrics_agents() {
    alias sed=gsed
    local IMAGE="3dsinteractive\/automation-technology"
    sed -ri "s/$IMAGE:$NAMESPACE-$APP_VERSION.[0-9]+?/$IMAGE:$NAMESPACE-$APP_VERSION.$TIMESTAMP/g" "./$NAMESPACE/app/builds/metrics-agents-build.yml"
    commit $IMAGE
}