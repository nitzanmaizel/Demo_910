#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating srvices files..." "frontend"

colored_echo "Create user hook file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/services/create_api_services.sh"

colored_echo "finished creating srvices files..." "success"