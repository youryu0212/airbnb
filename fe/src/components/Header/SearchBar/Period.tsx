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
        <Btn aria-label="체크인 날짜 입력 버튼">날짜 입력</Btn>
      </CommonWrapper>
      <CommonWrapper>
        <CheckOut>체크아웃</CheckOut>
        <Btn aria-label="체크아웃 날짜 입력 버튼">날짜 입력</Btn>
      </CommonWrapper>
      <button type="button" aria-label="날짜 입력 취소 버튼">
        <StyledCrossIcon />
      </button>
    </PeriodContainer>
  );
}

export default Period;
