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
        <Btn aria-label="요금 입력 버튼">₩100,000~1,000,000</Btn>
      </PriceWrapper>
      <button type="button" aria-label="요금 입력 취소 버튼">
        <StyledCrossIcon />
      </button>
    </PriceContainer>
  );
}

export default Price;
