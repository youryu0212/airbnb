import styled from 'styled-components';

function Logo() {
  return <StyledLogo>Logo</StyledLogo>;
}

const StyledLogo = styled.div`
  font-size: 40px;
  font-weight: bold;
  cursor: pointer;
  margin: 40px;
`;

export default Logo;
