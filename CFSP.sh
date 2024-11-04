#!/bin/bash
# Ensure Node.js and npm are installed
if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
  echo "Node.js and npm must be installed to run this script."
  exit 1
fi


# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"

colored_echo "Starting project setup..." "info"


# Log the current directory to verify the script's path
colored_echo "Script is running from: $SCRIPT_DIR" "info"

# # Create frontend directory and set up project structure
# colored_echo "Setting up frontend structure..." "frontend"
# mkdir -p frontend 

# # Initialize Vite project with React and TypeScript
# colored_echo "Initializing Vite project..." "frontend"
# if npm init vite@latest frontend -- --template react-ts -y; then
#   colored_echo "Frontend initialized with Vite." "frontend"
# else
#   colored_echo "Error initializing Vite. Exiting." "frontend"
#   exit 1
# fi

# # Set up frontend folders and basic files
# colored_echo "Creating frontend folder structure and base files..." "frontend"
# mkdir -p frontend/src/{assets,components,context,hooks,pages,services,types,utils}
# touch frontend/src/{App.tsx,index.css,vite-env.d.ts}


# # Run frontend setup scripts
# colored_echo "Running frontend setup scripts..." "frontend"
# source "$SCRIPT_DIR/frontend_shell/components/IconWrapper/create_icon_mapper.sh"
# source "$SCRIPT_DIR/frontend_shell/components/IconWrapper/create_icon_wrapper_tsx.sh"
# source "$SCRIPT_DIR/frontend_shell/components/Layout/create_footer.sh"
# source "$SCRIPT_DIR/frontend_shell/components/Layout/create_navbar.sh"
# source "$SCRIPT_DIR/frontend_shell/components/Layout/create_page_warpper.sh"
# source "$SCRIPT_DIR/frontend_shell/components/Layout/create_sidebar.sh"
# source "$SCRIPT_DIR/frontend_shell/context/create_snackbar_context.sh"
# source "$SCRIPT_DIR/frontend_shell/context/create_user_context.sh"
# source "$SCRIPT_DIR/frontend_shell/hooks/create_snackbar_hook.sh"
# source "$SCRIPT_DIR/frontend_shell/hooks/create_user_hook.sh"
# source "$SCRIPT_DIR/frontend_shell/pages/create_home_page.sh"
# source "$SCRIPT_DIR/frontend_shell/services/create_api_services.sh"
# source "$SCRIPT_DIR/frontend_shell/types/create_api_types.sh"
# source "$SCRIPT_DIR/frontend_shell/types/create_user_types.sh"
# source "$SCRIPT_DIR/frontend_shell/create_token_manager.sh"
# source "$SCRIPT_DIR/frontend_shell/create_index_css.sh"
# source "$SCRIPT_DIR/frontend_shell/create_vite_config.sh"
# source "$SCRIPT_DIR/frontend_shell/create_theme.sh"
# source "$SCRIPT_DIR/frontend_shell/create_main.sh"
# source "$SCRIPT_DIR/frontend_shell/create_app.sh"
# source "$SCRIPT_DIR/frontend_shell/create_index_html.sh"
# source "$SCRIPT_DIR/frontend_shell/create_package_file.sh"



source "$SCRIPT_DIR/backend_shell/create_backend.sh"

# colored_echo "Frontend - Installing dependencies and run build..." "frontend"
# cd frontend && npm install 
# colored_echo "Frontend - Building project..." "frontend"
# npm run build
# colored_echo "Backend - Installing dependencies and run build..." "backend"
# cd ../backend && npm install && npm run build
# npx ts-node src/scripts/createAdminUser.js

colored_echo "Project setup completed successfully!" "success"

