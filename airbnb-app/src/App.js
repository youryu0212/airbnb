import { CustomThemeProvider } from './custom-styled-component/CustomThemeProvider';
import theme from './common/theme';

function App() {
  return <CustomThemeProvider theme={theme}></CustomThemeProvider>;
}

export default App;
