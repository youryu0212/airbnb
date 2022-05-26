import {
  Personnel as PersonnelContainer,
  CommonWrapper,
  Label,
  Btn,
  StyledCrossIcon,
} from 'components/Header/SearchBar/searchBar.styled';

function Personnel() {
  return (
    <PersonnelContainer>
      <CommonWrapper>
        <Label>인원</Label>
        <Btn aria-label="게스트 추가 버튼">게스트 추가</Btn>
      </CommonWrapper>
      <button type="button" aria-label="게스트 추가 취소 버튼">
        <StyledCrossIcon />
      </button>
    </PersonnelContainer>
  );
}

export default Personnel;
