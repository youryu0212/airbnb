import styled from 'styled-components';

const StyledMenu = styled.ul`
  display: flex;

  li + li {
    margin-left: 24px;
  }
`;

export default StyledMenu;
