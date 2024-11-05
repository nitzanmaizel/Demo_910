#!/bin/bash
mkdir -p frontend/src

# Create useSnackbar.tsx file with content
cat <<EOL > frontend/src/app.tsx
import React from 'react';
import { Routes, Route } from 'react-router-dom';

import HomePage from './pages/HomePage';
import DashboardPage from './pages/DashboardPage';
import UsersPage from './pages/UsersPage';

import ProtectedRoute from './pages/ProtectedRoute';

const App: React.FC = () => {
  return (
    <Routes>
      <Route path='/' element={<HomePage />} />
      <Route element={<ProtectedRoute />}>
        <Route path='/dashboard' element={<DashboardPage />} />
        <Route path='/users' element={<UsersPage />} />
      </Route>
    </Routes>
  );
};

export default App;
EOL