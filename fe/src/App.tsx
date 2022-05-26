import { ThemeProvider as StyledThemeProvider } from 'styled-components';
import { CssBaseline, ThemeProvider } from '@mui/material';
import { theme as globalTheme } from 'styles/GlobalStyles';
import { theme as StyledTheme } from 'styles/theme';

import Router from 'Router';

function App() {
  return (
    <ThemeProvider theme={globalTheme}>
      <CssBaseline />
      <StyledThemeProvider theme={StyledTheme}>
        <Router />
      </StyledThemeProvider>
    </ThemeProvider>
  );
}

export default App;
