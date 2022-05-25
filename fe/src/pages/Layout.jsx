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
  width: 1440px;
  position: relative;
  margin: 0 auto;
`;
export default Layout;
