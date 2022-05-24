import { useState } from 'react';
import styled from 'styled-components';
import MiniSearchBar from './MiniSearchBar';
import SearchBar from './SearchBar';

function SearchWrapper() {
  const [miniFocus, setMiniFocus] = useState(true);

  const changeSearchBar = () => {
    return miniFocus ? setMiniFocus(false) : setMiniFocus(true);
  };
  return (
    <SearchWrap>
      {miniFocus ? (
        <MiniSearchBar changeSearchBar={changeSearchBar} />
      ) : (
        <SearchBar changeSearchBar={changeSearchBar} />
      )}
    </SearchWrap>
  );
}

export const SearchWrap = styled.div`
  display: flex;
  flex-direction: column;
`;

export default SearchWrapper;
