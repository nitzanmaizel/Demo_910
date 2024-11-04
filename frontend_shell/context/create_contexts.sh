#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating context files..." "frontend"

colored_echo "Create user context file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/context/create_user_context.sh"

colored_echo "Create snackbar context file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/context/create_snackbar_context.sh"

colored_echo "finished creating components files..." "success"