#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating middleware files..." "backend"

colored_echo "Creating middleware cors file..." "backend"
source "$SCRIPT_DIR/backend_shell/middleware/create_middleware_cors.sh"

colored_echo "Creating middleware JWT file..." "backend"
source "$SCRIPT_DIR/backend_shell/middleware/create_middleware_JWT.sh"

colored_echo "Creating middleware token file..." "backend"
source "$SCRIPT_DIR/backend_shell/middleware/create_middleware_token.sh"

colored_echo "Creating middleware index file..." "backend"
source "$SCRIPT_DIR/backend_shell/middleware/create_middleware_index.sh"

colored_echo "finished creating middlewares files..." "success"