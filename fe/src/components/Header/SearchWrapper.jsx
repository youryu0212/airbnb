import styled from 'styled-components';
import MiniSearchBar from './MiniSearchBar';
import SearchBar from './SearchBar';

function SearchWrapper({ changeSearchBar, miniFocus, setMiniFocus }) {
  function mouseLeave() {
    if (!miniFocus) {
      setMiniFocus(true);
    }
  }

  return (
    <SearchWrap onMouseLeave={() => mouseLeave()}>
      {miniFocus ? <MiniSearchBar changeSearchBar={changeSearchBar} /> : <SearchBar />}
    </SearchWrap>
  );
}

export const SearchWrap = styled.div`
  display: flex;
  flex-direction: column;
`;

export default SearchWrapper;
