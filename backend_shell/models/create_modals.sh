#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating modals files..." "backend"

colored_echo "Creating user modal file..." "backend"
source "$SCRIPT_DIR/backend_shell/models/create_user_model.sh"

colored_echo "finished creating modals files..." "success"