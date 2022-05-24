import { Outlet } from 'react-router-dom';

import Header from 'components/Header/index';

function Layout() {
  return (
    <>
      <Header />
      <Outlet />
    </>
  );
}

export default Layout;
