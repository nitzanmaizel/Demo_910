#!/bin/bash
mkdir -p frontend/src

# Create useSnackbar.tsx file with content
cat <<EOL > frontend/package.json
{
  "name": "frontend",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc -b && vite build",
    "lint": "eslint .",
    "preview": "vite preview"
  },
  "dependencies": {
    "@emotion/react": "^11.13.3",
    "@emotion/styled": "^11.13.0",
    "@mui/icons-material": "^6.0.2",
    "@mui/material": "^6.0.2",
    "@mui/x-data-grid": "^7.20.0",
    "@tanstack/react-query": "^5.59.0",
    "@tanstack/react-query-devtools": "^5.59.6",
    "date-fns": "^4.1.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-router-dom": "^6.26.1",
    "stylis": "^4.3.4",
    "stylis-plugin-rtl": "^2.1.1"
  },
  "devDependencies": {
    "@eslint/js": "^9.11.1",
    "@types/react": "^18.3.10",
    "@types/react-dom": "^18.3.0",
    "@types/react-router-dom": "^5.3.3",
    "@types/stylis": "^4.2.6",
    "@vitejs/plugin-react": "^4.3.2",
    "@vitejs/plugin-react-swc": "^3.5.0",
    "eslint": "^9.11.1",
    "eslint-plugin-react-hooks": "^5.1.0-rc.0",
    "eslint-plugin-react-refresh": "^0.4.12",
    "globals": "^15.9.0",
    "typescript": "^5.5.3",
    "typescript-eslint": "^8.7.0",
    "vite": "^5.4.8",
    "vite-tsconfig-paths": "^5.0.1"
  }
}
EOL