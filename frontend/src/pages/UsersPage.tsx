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
