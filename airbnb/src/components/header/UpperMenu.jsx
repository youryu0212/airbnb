import React from 'react';
import styled from 'styled-components';

function UpperMenu(props) {
  return (
    <UpperMenuDiv>
      <UpperMenuContent>숙소</UpperMenuContent>
      <UpperMenuContent>체험</UpperMenuContent>
      <UpperMenuContent>온라인체험</UpperMenuContent>
    </UpperMenuDiv>
  );
}

const UpperMenuDiv = styled.div`
  height: 23px;
`;

const UpperMenuContent = styled.span`
  weight: 400;
  font-size: ${({ theme }) => theme.size.xs};
  cursor: pointer;
`;

export default UpperMenu;
