import { useState } from 'react';
import { useLocation } from 'react-router-dom';

import styled from 'styled-components';
import { Avatar, Link } from '@material-ui/core';
import { ReactComponent as HamburgerIcon } from 'images/FE_숙소예약서비스/Property 1=menu.svg';
import { ReactComponent as LogoImg } from 'images/logo.svg';

import Menu from 'components/Header/Menu';
import SearchBar from 'components/Header/SearchBar/index';
import SearchWrapper, { SearchWrap } from './SearchWrapper';

type Position = {
  position: string;
};

function Header() {
  const location = useLocation();
  const [miniFocus, setMiniFocus] = useState(true);

  const changeSearchBar = () => {
    return miniFocus ? setMiniFocus(false) : setMiniFocus(true);
  };
  return (
    <HeaderWrap position={location.pathname}>
      <Link href="/" style={{ height: '26px' }}>
        <LogoImg aria-label="로고이미지" />
      </Link>
      {location.pathname === '/' ? (
        <SearchWrap>
          <Menu />
          <SearchBar />
        </SearchWrap>
      ) : (
        <SearchWrapper
          changeSearchBar={changeSearchBar}
          miniFocus={miniFocus}
          setMiniFocus={setMiniFocus}
        />
      )}
      <UserWrapper>
        <CustomButton type="button" aria-label="유저 정보 메뉴">
          <Hamburger>햄버거</Hamburger>
        </CustomButton>
        <button type="button" aria-label="유저 아바타">
          <CustomAvatar src="images/FE_숙소예약서비스/Property 1=user.svg" />
        </button>
      </UserWrapper>
    </HeaderWrap>
  );
}

const HeaderWrap = styled.header<Position>`
  display: flex;
  justify-content: space-between;
  padding: 24px;
  margin-bottom: 20px;
  position: ${(props) => {
    return props.position === '/' ? 'fixed' : 'sticky';
  }};
  top: 0;
  width: 1440px;
`;

const UserWrapper = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 76px;
  height: 40px;
  border-radius: 999px;
  border: 1px solid ${({ theme }) => theme.colors.grey4};
  background: ${({ theme }) => theme.colors.white};
`;

const CustomButton = styled.button`
  padding: 16px 8px;
`;

const Hamburger = styled(HamburgerIcon)`
  width: 16px;
  height: 16px;

  path {
    stroke: ${({ theme }) => theme.colors.grey2};
  }
`;

const CustomAvatar = styled(Avatar)`
  width: 32px;
  height: 32px;
  background: ${({ theme }) => theme.colors.grey3};
`;
export default Header;
