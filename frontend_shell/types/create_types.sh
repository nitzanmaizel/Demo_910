#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating types files..." "frontend"

colored_echo "Create api types file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/types/create_api_types.sh"

colored_echo "Create user types file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/types/create_user_types.sh"

colored_echo "finished creating types files..." "success"