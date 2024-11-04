#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating pages files..." "frontend"

colored_echo "Create user hook file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/pages/create_home_page.sh"

colored_echo "finished creating pages files..." "success"