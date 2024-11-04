import React from 'react';
import { Box } from '@mui/material';

import PageWrapper from '../components/Layout/PageWrapper';
import { useUser } from '../hooks/useUser';

const HomePage: React.FC = () => {
  const { userInfo } = useUser();

  return (
    <PageWrapper title='Home Page'>
      <Box>
        <h1>Welcome, {userInfo?.fullName}!</h1>
        <ul>
          {userInfo &&
            Object.entries(userInfo).map(([key, value]) => (
              <li key={key}>
                <strong>{key}:</strong> {value}
              </li>
            ))}
        </ul>
      </Box>
    </PageWrapper>
  );
};

export default HomePage;
