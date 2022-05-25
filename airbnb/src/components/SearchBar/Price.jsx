import React from 'react';
import styled from 'styled-components';

function Price() {
  return (
    <Btn>
      <ContentBox>
        <BarTitle>요금</BarTitle>
        <BarContent>금액대 설정</BarContent>
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
export default Price;
