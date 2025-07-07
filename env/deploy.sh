#!/bin/bash
set -e

# Get the directory where the script is located and change to it
ORIGINAL_DIR="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

#check if hash hasura execute binary
if ! command -v hasura &> /dev/null
then
    # install hasura cli
    echo "install hasura cli ..."
    curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
fi

# should config hasura/me-scan/metadata/databases/databases.yaml for callisto
# Prompts whether database configuration has been completed
if [ ! -f "$SCRIPT_DIR/cluster-config/hasura/gea-scan/metadata/databases/databases.yaml" ]; then
    echo "Please complete the database configuration for hasura/gea-scan/metadata/databases/databases.yaml"
    exit 1
fi

# deploy the cluster
docker stack deploy -c "$SCRIPT_DIR/docker-compose.yml" gea-scan
sleep 10

# init db
bdjuno init-db --home "$SCRIPT_DIR/cluster-config/rollapp-home"
callisto init-db --home "$SCRIPT_DIR/cluster-config/gea-hub-home"

# apply the hasura metadata
cd "$SCRIPT_DIR/cluster-config/hasura/gea-scan"
hasura metadata apply --endpoint http://127.0.0.1:8080
hasura migrate apply --endpoint http://127.0.0.1:8080
hasura metadata reload
cd "$ORIGINAL_DIR"
