import { Flex, Spacer } from '@chakra-ui/react';
import styled from 'styled-components';
import Logo from './Logo';
import UpperMenu from './UpperMenu';
import UserInfo from './UserInfo';

function Header() {
  return (
    <StyledHeader>
      <Flex justify="center" align="center">
        <Logo />
        <Spacer />
        <UpperMenu />
        <Spacer />
        <UserInfo />
      </Flex>
    </StyledHeader>
  );
}

const StyledHeader = styled.header`
  height: 640px;
  background-image: url('https://wallpaperaccess.com/full/321122.jpg');
  background-position: center;
  background-repeat: no-repeat;
  background-size: 150% 100%;
`;

export default Header;
