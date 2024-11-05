#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating services files..." "backend"

colored_echo "Creating services authUser file..." "backend"
source "$SCRIPT_DIR/backend_shell/services/create_service_authUser.sh"

colored_echo "Creating services user services file..." "backend"
source "$SCRIPT_DIR/backend_shell/services/create_user_services.sh"

colored_echo "finished creating services files..." "success"