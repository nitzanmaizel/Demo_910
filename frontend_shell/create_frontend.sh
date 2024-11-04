#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/helpers.sh"

# Create frontend directory and set up project structure
colored_echo "Setting up frontend structure..." "frontend"
mkdir -p frontend 

# Initialize Vite project with React and TypeScript
colored_echo "Initializing Vite project..." "frontend"
if npm init vite@latest frontend -- --template react-ts -y; then
  colored_echo "Frontend initialized with Vite." "frontend"
else
  colored_echo "Error initializing Vite. Exiting." "frontend"
  exit 1
fi

# Set up frontend folders and basic files
colored_echo "Creating frontend folder structure and base files..." "frontend"
mkdir -p frontend/src/{assets,components,context,hooks,pages,services,types,utils}
touch frontend/src/{App.tsx,index.css,vite-env.d.ts}

colored_echo "Running frontend setup scripts..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/create_components.sh"
source "$SCRIPT_DIR/frontend_shell/context/create_contexts.sh"
source "$SCRIPT_DIR/frontend_shell/hooks/create_hooks.sh"
source "$SCRIPT_DIR/frontend_shell/pages/create_pages.sh"
source "$SCRIPT_DIR/frontend_shell/services/create_services.sh"
source "$SCRIPT_DIR/frontend_shell/types/create_types.sh"
source "$SCRIPT_DIR/frontend_shell/create_token_manager.sh"
source "$SCRIPT_DIR/frontend_shell/create_index_css.sh"
source "$SCRIPT_DIR/frontend_shell/create_vite_config.sh"
source "$SCRIPT_DIR/frontend_shell/create_theme.sh"
source "$SCRIPT_DIR/frontend_shell/create_main.sh"
source "$SCRIPT_DIR/frontend_shell/create_app.sh"
source "$SCRIPT_DIR/frontend_shell/create_index_html.sh"
source "$SCRIPT_DIR/frontend_shell/create_package_file.sh"
