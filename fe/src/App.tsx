import React from 'react';
import reset from 'styled-reset';
import { createGlobalStyle } from 'styled-components';
import Routers from 'components/Routers/Routers';

const GlobalStyles = createGlobalStyle`
    ${reset};
`;

function App() {
  return (
    <div className="App">
      <GlobalStyles />
      <Routers />
    </div>
  );
}

export default App;
