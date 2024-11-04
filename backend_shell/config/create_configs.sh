#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating configs files..." "backend"

colored_echo "Creating mongo file..." "backend"
source "$SCRIPT_DIR/backend_shell/config/create_mongo_config.sh"

colored_echo "Creating google oauth file..." "backend"
source "$SCRIPT_DIR/backend_shell/config/create_oauth_config.sh"

colored_echo "finished creating configs files..." "success"