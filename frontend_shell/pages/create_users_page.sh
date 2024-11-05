#!/bin/bash
mkdir -p frontend/src/pages

# Create HomePage.tsx file with content
cat <<EOL > frontend/src/pages/UsersPage.tsx
import PageWrapper from '../components/Layout/PageWrapper';
import UsersList from '../components/Lists/UsersList';

const UsersPage = () => {
  return (
    <PageWrapper title='רשימת משתמשים'>
      <UsersList />
    </PageWrapper>
  );
};

export default UsersPage;
EOL