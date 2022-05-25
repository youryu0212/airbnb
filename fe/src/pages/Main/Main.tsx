import React from 'react';
import GNB from 'components/GNB/GNB';
import styled from 'styled-components';
import backGroundImg from 'img/png/hero-img.png';

const Header = styled.header`
  height: 640px;
  background-image: url(${backGroundImg});
  background-size: cover;
  background-position: bottom;
  background-repeat: no-repeat;
`;

function Main() {
  return (
    <main>
      <Header>
        <GNB />
      </Header>
    </main>
  );
}

export default Main;
