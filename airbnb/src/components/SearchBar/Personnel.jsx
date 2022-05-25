import React from 'react';
import styled from 'styled-components';

function Personnel() {
  return (
    <Btn>
      <ContentBox>
        <BarTitle>인원</BarTitle>
        <BarContent>게스트 추가</BarContent>
      </ContentBox>
    </Btn>
  );
}

const Btn = styled.button`
  width: 25%;
  margin: 0 auto;
`;

const ContentBox = styled.div`
  display: flex;
  flex-direction: column;
  text-align: center;
`;

const BarTitle = styled.span`
  font-weight: bold;
  font-size: 12px;
  line-height: 17px;
`;

const BarContent = styled.span``;
export default Personnel;
