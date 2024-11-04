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

source "$SCRIPT_DIR/frontend_shell/create_frontend.sh"
source "$SCRIPT_DIR/backend_shell/create_backend.sh"


colored_echo "Frontend - Installing dependencies and run build..." "frontend"
cd frontend && npm install 
colored_echo "Frontend - Building project..." "frontend"
npm run build
colored_echo "Backend - Installing dependencies and run build..." "backend"
cd ../backend && npm install && npm run build

colored_echo "Project setup completed successfully!" "success"

