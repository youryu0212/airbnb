import { Flex, Spacer } from '@chakra-ui/react';
import styled from 'styled-components';
import Logo from './Logo';
import UpperMenu from './UpperMenu';
import UserInfo from './UserInfo';
import SearchBar from './SearchBar';

function Header() {
  return (
    <HeaderDiv>
      <Flex>
        <Logo />
        <Spacer />
        <UpperMenu />
        <Spacer />
        <UserInfo />
      </Flex>
      <SearchBar />
    </HeaderDiv>
  );
}

const HeaderDiv = styled.div`
  display: flex;
  flex-direction: column;
  height: 600px;
  background-image: url('https://wallpaperaccess.com/full/321122.jpg');
  background-position: center;
  background-repeat: no-repeat;
  background-size: 70% 100%;
`;

export default Header;
