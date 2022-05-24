import styled from 'styled-components';
import { Avatar } from '@material-ui/core';
import { ReactComponent as HamburgerIcon } from 'images/FE_숙소예약서비스/Property 1=menu.svg';
import Menu from 'components/Header/Menu';
import SearchBar from 'components/Header/SearchBar/index';
import { useLocation } from 'react-router-dom';
import SearchWrapper, { SearchWrap } from './SearchWrapper';

function Header() {
  const location = useLocation();

  return (
    <HeaderWrap>
      <Logo>LOGO</Logo>
      {location.pathname === '/' ? (
        <SearchWrap>
          <Menu />
          <SearchBar />
        </SearchWrap>
      ) : (
        <SearchWrapper />
      )}
      <UserWrapper>
        <Hamburger>햄버거</Hamburger>
        <CustomAvatar src="images/FE_숙소예약서비스/Property 1=user.svg" />
      </UserWrapper>
    </HeaderWrap>
  );
}

const HeaderWrap = styled.div`
  display: flex;
  justify-content: space-between;
  padding: 24px;
  margin-bottom: 20px;
`;

const Logo = styled.span`
  ${({ theme }) => theme.fontStyles.logo};
  color: ${({ theme }) => theme.colors.grey1};
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

const Hamburger = styled(HamburgerIcon)`
  width: 16px;
  height: 16px;
  margin: 0 8px 0 12px;

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
