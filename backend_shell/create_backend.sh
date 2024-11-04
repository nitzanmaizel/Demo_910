#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"

# colored_echo "Setting up backend structure..." "backend"
mkdir -p backend 
mkdir -p backend/src/{routes,middleware,utils,types,models,config,services,controllers}
touch backend/src/server.ts

source "$SCRIPT_DIR/backend_shell/config/create_configs.sh"
source "$SCRIPT_DIR/backend_shell/controllers/create_controllesrs.sh"
source "$SCRIPT_DIR/backend_shell/middleware/create_middlwares.sh"
source "$SCRIPT_DIR/backend_shell/models/create_modals.sh"
source "$SCRIPT_DIR/backend_shell/routes/create_routes.sh"
source "$SCRIPT_DIR/backend_shell/services/create_services.sh"
source "$SCRIPT_DIR/backend_shell/types/create_types.sh"
source "$SCRIPT_DIR/backend_shell/scripts/create_admin_user.sh"
source "$SCRIPT_DIR/backend_shell/create_server_file.sh"
source "$SCRIPT_DIR/backend_shell/create_root_files.sh"


