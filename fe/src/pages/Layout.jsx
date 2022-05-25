import { Outlet } from 'react-router-dom';
import Header from 'components/Header/index';
import styled from 'styled-components';

function Layout() {
  return (
    <Container>
      <Header />
      <Outlet />
    </Container>
  );
}

const Container = styled.div`
  position: relative;
`;
export default Layout;
