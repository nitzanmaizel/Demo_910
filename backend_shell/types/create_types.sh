#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating types files..." "backend"

colored_echo "Creating services user type file..." "backend"
source "$SCRIPT_DIR/backend_shell/types/create_user_type.sh"

colored_echo "finished creating types files..." "success"