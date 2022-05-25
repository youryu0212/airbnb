import React from 'react';
import styled from 'styled-components';
import { Button } from '@mui/material';

const CustomDiv = styled.div`
  width: 50px;
  height: 50px;
  background-color: black;
`;

const CustomButton = styled(Button)`
  width: 100px;
  height: 100px;
`;

function App() {
  return (
    <div>
      <CustomDiv />
      <CustomButton>버튼</CustomButton>
    </div>
  );
}

export default App;
