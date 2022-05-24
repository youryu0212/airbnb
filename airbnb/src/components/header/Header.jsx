import { Flex, Spacer } from '@chakra-ui/react';
import styled from 'styled-components';

import Logo from './Logo';
import UpperMenu from './UpperMenu';
import UserInfo from './UserInfo';

function Header() {
  return (
    <Div>
      <Flex>
        <Logo />
        <Spacer />
        <UpperMenu />
        <Spacer />
        <UserInfo />
      </Flex>
    </Div>
  );
}

const Div = styled.div`
  height: 600px;
`;
export default Header;
