import React from 'react';
import { Box } from '@mui/material';
import PageWrapper from '../components/Layout/PageWrapper';
import CategoryCard from '../components/Cards/CategoryCard';

const DashboardPage: React.FC = () => {
  return (
    <PageWrapper title='מרכז שליטה'>
      <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 4 }}>
        {categories.map((category, index) => (
          <Box
            key={index}
            sx={{ flex: '1 1 calc(25% - 16px)', minWidth: '250px', display: 'flex' }}
          >
            <CategoryCard
              title={category.title}
              icon={category.icon}
              description={category.description}
              link={category.link}
            />
          </Box>
        ))}
      </Box>
    </PageWrapper>
  );
};

export default DashboardPage;

const categories = [
  {
    title: 'ניהול מסמכים',
    icon: 'products',
    description: 'ערוך, צור, מחק ונהל את רשימת המסמכים שלך.',
    link: '/sheets',
  },
  {
    title: 'ניהול משתמשים',
    icon: 'users',
    description: 'נהל את רשימת המשתמשים וההרשאות שלהם.',
    link: '/users',
  },
  {
    title: 'אנליטיקה',
    icon: 'analytics',
    description: 'צפה בנתוני האנליטיקה של האתר שלך.',
    link: '/analytics',
  },
];
