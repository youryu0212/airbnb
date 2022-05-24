import {
  Price as PriceContainer,
  PriceWrapper,
  Label,
  Btn,
  StyledCrossIcon,
} from 'components/Header/SearchBar/searchBar.styled';

function Price() {
  return (
    <PriceContainer>
      <PriceWrapper>
        <Label>요금</Label>
        <Btn>₩100,000~1,000,000</Btn>
      </PriceWrapper>
      <StyledCrossIcon />
    </PriceContainer>
  );
}

export default Price;
