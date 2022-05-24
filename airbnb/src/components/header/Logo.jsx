import React from 'react';
import styled from 'styled-components';

function Logo() {
  return <StyledLogo>Logo</StyledLogo>;
}

const StyledLogo = styled.div`
  font-size: ${({ theme }) => theme.size.xl};
`;

export default Logo;
