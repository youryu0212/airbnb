import React from 'react';
import styled from 'styled-components';

function CheckOut() {
  return (
    <>
      <Btn>
        <ContentBox>
          <BarTitle>체크인</BarTitle>
          <BarContent>날짜입력</BarContent>
        </ContentBox>
      </Btn>
      <Btn>
        <ContentBox>
          <BarTitle>체크아웃</BarTitle>
          <BarContent>날짜입력</BarContent>
        </ContentBox>
      </Btn>
    </>
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
export default CheckOut;
