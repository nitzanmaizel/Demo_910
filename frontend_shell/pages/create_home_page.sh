#!/bin/bash
mkdir -p frontend/src/pages

# Create HomePage.tsx file with content
cat <<EOL > frontend/src/pages/HomePage.tsx
import React from 'react';
import { Box } from '@mui/material';

import PageWrapper from '../components/Layout/PageWrapper';
import { useUser } from '../hooks/useUser';

const HomePage: React.FC = () => {
  const { userInfo } = useUser();

  return (
    <PageWrapper>
      <Box>
        <h1>Welcome, {userInfo?.fullName}!</h1>
        {userInfo && (
          <ul>
            {Object.entries(userInfo).map(([key, value]) => (
              <li key={key}>
                <strong>{key}:</strong> {value}
              </li>
            ))}
          </ul>
        )}
      </Box>
    </PageWrapper>
  );
};

export default HomePage;
EOL