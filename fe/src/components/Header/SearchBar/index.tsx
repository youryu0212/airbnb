import { Divider } from '@material-ui/core';
import { SearchBarWrap, SearchBarContainer } from 'components/Header/SearchBar/searchBar.styled';
import Period from 'components/Header/SearchBar/Period';
import Personnel from 'components/Header/SearchBar/Personnel';
import Price from 'components/Header/SearchBar/Price';
import SearchButton from 'components/Header/SearchBar/SearchButton';
import PeriodModal from './Modals/PeriodModal';
import PriceModal from './Modals/PriceModal';
import PersonnelModal from './Modals/PersonnelModal';

function SearchBar() {
  return (
    <SearchBarContainer>
      <SearchBarWrap>
        <Period />
        <Divider orientation="vertical" />
        <Price />
        <Divider orientation="vertical" />
        <Personnel />
        <SearchButton />
      </SearchBarWrap>
      <PeriodModal />
      <PriceModal />
      <PersonnelModal />
    </SearchBarContainer>
  );
}

export default SearchBar;
