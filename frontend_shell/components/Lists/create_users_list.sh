#!/bin/bash
mkdir -p frontend/src/components/Lists

# Create useSnackbar.tsx file with content
cat <<EOL > frontend/src/components/Lists/UsersList.tsx
import React from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from '@mui/material';
import { Box, Paper } from '@mui/material';
import UserTableSkeleton from '../Skeletons/UserTableSkeleton';
import { useUsersQuery } from '../../services/userServices';

const UsersList: React.FC = () => {
  const usersQuery = useUsersQuery();

  if (usersQuery.isLoading) {
    return <UserTableSkeleton />;
  }

  if (usersQuery.isError) {
    return (
      <Box display={'flex'} justifyContent={'center'}>
        Error: {usersQuery.error.message}
      </Box>
    );
  }

  return (
    <React.Fragment>
      <TableContainer sx={{ boxShadow: 3, marginTop: 1 }} component={Paper}>
        <Table sx={{ 'td, th': { whiteSpace: 'nowrap' } }}>
          <TableHead>
            <TableRow>
              {tableHeaders.map((header) => (
                <TableCell key={header.id}>{header.label}</TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {usersQuery.data?.users.map((user) => (
              <TableRow key={user.idNumber}>
                <TableCell>{user.lastName}</TableCell>
                <TableCell>{user.firstName}</TableCell>
                <TableCell>{user.idNumber}</TableCell>
                <TableCell>{user.company}</TableCell>
                <TableCell>{user.section}</TableCell>
                <TableCell>{user.phoneNumber}</TableCell>
                <TableCell>{user.armyRole}</TableCell>
                <TableCell>{user.role}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </React.Fragment>
  );
};

export default UsersList;

const tableHeaders = [
  { id: 'lastName', label: 'שם משפחה' },
  { id: 'firstName', label: 'שם פרטי' },
  { id: 'idNumber', label: 'מספר אישי' },
  { id: 'company', label: 'פלוגה' },
  { id: 'section', label: 'מחלקה' },
  { id: 'phoneNumber', label: 'פלאפון' },
  { id: 'armyRole', label: 'תפקיד' },
  { id: 'role', label: 'סוג משתמש' },
];
EOL