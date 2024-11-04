#!/bin/bash
mkdir -p frontend/src

echo "Creating main file..."

# Create useSnackbar.tsx file with content
cat <<EOL > frontend/src/main.tsx
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter as Router } from "react-router-dom";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

import { ThemeProvider } from "@mui/material/styles";
import { CssBaseline } from "@mui/material";
import rtlPlugin from "stylis-plugin-rtl";
import { prefixer } from "stylis";
import { CacheProvider } from "@emotion/react";
import createCache from "@emotion/cache";

import { UserProvider } from "./context/UserContext";
import { SnackbarProvider } from "./context/SnackbarContext.tsx";

import App from "./App.tsx";
import theme from "./theme.tsx";
import "./index.css";

const queryClient = new QueryClient();

const cacheRtl = createCache({
  key: "muirtl",
  stylisPlugins: [prefixer, rtlPlugin],
});

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <Router>
      <QueryClientProvider client={queryClient}>
        <CacheProvider value={cacheRtl}>
          <SnackbarProvider>
            <UserProvider>
              <ThemeProvider theme={theme}>
                <CssBaseline />
                <App />
                <ReactQueryDevtools initialIsOpen={false} />
              </ThemeProvider>
            </UserProvider>
          </SnackbarProvider>
        </CacheProvider>
      </QueryClientProvider>
    </Router>
  </StrictMode>
);
EOL