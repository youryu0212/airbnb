import styled from 'styled-components';
import { Divider } from '@material-ui/core';
import { SearchButton, StyledSearchIcon, Btn } from 'components/Header/SearchBar/searchBar.styled';

function MiniSearchBar({ changeSearchBar }: any) {
  return (
    <MiniSearchBarWrap onClick={changeSearchBar}>
      <MiniBarButton>일정 입력</MiniBarButton>
      <Divider orientation="vertical" />
      <PriceButton>₩100,000~1,000,000</PriceButton>
      <Divider orientation="vertical" />
      <MiniBarButton>인원 입력</MiniBarButton>
      <MiniSearchBtn>
        <StyledSearchButton>
          <MiniSearchIcon />
        </StyledSearchButton>
      </MiniSearchBtn>
    </MiniSearchBarWrap>
  );
}

const MiniSearchBarWrap = styled.div`
  margin: 0 auto;
  width: 410px;
  height: 48px;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border-radius: 999px;
  padding: 8px 8px 8px 24px;
  border: 1px solid ${({ theme }) => theme.colors.grey4};
`;

const MiniSearchBtn = styled.button`
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: ${({ theme }) => theme.colors.primary};
`;

const MiniBarButton = styled(Btn)`
  color: ${({ theme }) => theme.colors.grey3};
`;

const PriceButton = styled(MiniBarButton)`
  color: ${({ theme }) => theme.colors.grey3};
`;

const StyledSearchButton = styled(SearchButton)`
  padding: 0;
  height: 0;
`;

const MiniSearchIcon = styled(StyledSearchIcon)`
  width: 16px;
  height: 16px;
`;

export default MiniSearchBar;
