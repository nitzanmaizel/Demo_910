#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating hooks files..." "frontend"

colored_echo "Create user hook file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/hooks/create_user_hook.sh"

colored_echo "Create snackbar hook file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/hooks/create_snackbar_hook.sh"

colored_echo "finished creating hook files..." "success"