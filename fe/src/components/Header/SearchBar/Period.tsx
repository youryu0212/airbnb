import {
  Period as PeriodContainer,
  CommonWrapper,
  CheckIn,
  CheckOut,
  Btn,
  StyledCrossIcon,
} from 'components/Header/SearchBar/searchBar.styled';

function Period() {
  return (
    <PeriodContainer>
      <CommonWrapper>
        <CheckIn>체크인</CheckIn>
        <Btn>날짜 입력</Btn>
      </CommonWrapper>
      <CommonWrapper>
        <CheckOut>체크아웃</CheckOut>
        <Btn>날짜 입력</Btn>
      </CommonWrapper>
      <StyledCrossIcon />
    </PeriodContainer>
  );
}

export default Period;
