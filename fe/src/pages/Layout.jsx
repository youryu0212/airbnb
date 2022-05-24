import React from 'react';
import { Outlet } from 'react-router-dom';

function Layout() {
  return (
    <>
      <div>header</div>
      <Outlet />
    </>
  );
}

export default Layout;
