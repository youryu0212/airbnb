import { Divider } from '@material-ui/core';
import { SearchBarWrap } from 'components/Header/SearchBar/searchBar.styled';
import Period from 'components/Header/SearchBar/Period';
import Personnel from 'components/Header/SearchBar/Personnel';
import Price from 'components/Header/SearchBar/Price';
import SearchButton from 'components/Header/SearchBar/SearchButton';

function SearchBar({ changeSearchBar }: any) {
  return (
    <SearchBarWrap onClick={changeSearchBar}>
      <Period />
      <Divider orientation="vertical" />
      <Price />
      <Divider orientation="vertical" />
      <Personnel />
      <SearchButton />
    </SearchBarWrap>
  );
}

export default SearchBar;
