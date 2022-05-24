import { createGlobalStyle } from 'styled-components';
import reset from 'reset-css';

const GlobalStyle = createGlobalStyle`
    ${reset}; 

    button{
      background: none;
      cursor: pointer;
      margin: 0 auto;
      border: none;
    }
`;

export default GlobalStyle;
