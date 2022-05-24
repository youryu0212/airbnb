import styled from 'styled-components';
import { ButtonGroup, Button } from '@material-ui/core';

function Menu() {
  return (
    <CustomButtonGroup>
      <CustomButton>숙소</CustomButton>
      <CustomButton>체험</CustomButton>
      <CustomButton>온라인 체험</CustomButton>
    </CustomButtonGroup>
  );
}

const CustomButtonGroup = styled(ButtonGroup)`
  margin: 0 auto;
  margin-bottom: 32px;
  border: none;
`;

const CustomButton = styled(Button)`
  border: none;

  &:hover {
    background: none;
    ${({ theme }) => theme.fontStyles.bold16px};
  }
`;

export default Menu;
