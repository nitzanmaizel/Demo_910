#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating controllesrs files..." "backend"

colored_echo "Creating authControllers file..." "backend"
source "$SCRIPT_DIR/backend_shell/controllers/authControllers.sh"

colored_echo "finished creating controllers files..." "success"