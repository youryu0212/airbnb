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
        <Btn>게스트 추가</Btn>
      </CommonWrapper>
      <StyledCrossIcon />
    </PersonnelContainer>
  );
}

export default Personnel;
