#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating routes files..." "backend"

colored_echo "Creating auth route file..." "backend"
source "$SCRIPT_DIR/backend_shell/routes/create_route_auth.sh"

colored_echo "Creating index route file..." "backend"
source "$SCRIPT_DIR/backend_shell/routes/create_route_index.sh"

colored_echo "finished creating routes files..." "success"