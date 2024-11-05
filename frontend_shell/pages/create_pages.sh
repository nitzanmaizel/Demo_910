#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating pages files..." "frontend"

colored_echo "Create home page file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/pages/create_home_page.sh"

colored_echo "Create dashboard page file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/pages/create_dashboard_page.sh"

colored_echo "Create users page file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/pages/create_users_page.sh"

colored_echo "Create protected route file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/pages/create_protected_route.sh"


colored_echo "finished creating pages files..." "success"