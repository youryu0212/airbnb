import {
  SearchButton as SearchButtonContainer,
  StyledSearchIcon,
} from 'components/Header/SearchBar/searchBar.styled';

function SearchButton() {
  return (
    <SearchButtonContainer>
      <StyledSearchIcon />
      <span>검색</span>
    </SearchButtonContainer>
  );
}

export default SearchButton;
