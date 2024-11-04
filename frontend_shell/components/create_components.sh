#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/helpers.sh"
colored_echo "Creating components files..." "frontend"

colored_echo "Creating category card file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/Cards/create_category_card.sh"

colored_echo "Creating IconWrapper files..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/IconWrapper/create_icon_mapper.sh"
source "$SCRIPT_DIR/frontend_shell/components/IconWrapper/create_icon_wrapper_tsx.sh"

colored_echo "Creating Layout files..." "frontend"
colored_echo "Creating footer file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/Layout/create_footer.sh"

colored_echo "Creating navbar file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/Layout/create_navbar.sh"

colored_echo "Creating page warpper file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/Layout/create_page_warpper.sh"

colored_echo "Creating sidebar file..." "frontend"
source "$SCRIPT_DIR/frontend_shell/components/Layout/create_sidebar.sh"

colored_echo "finished creating components files..." "success"