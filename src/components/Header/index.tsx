import React from 'react';
import TopBar from '@components/Header/TopBar';
import { Container, Contents } from '@components/Header/index.style';

function Header() {
  return (
    <Container>
      <Contents>
        <TopBar />
      </Contents>
    </Container>
  );
}

export default Header;
