import { ThemeProvider } from 'styled-components';

import Footer from 'components/footer/Footer';
import Header from 'components/header/Header';
import Main from 'components/main/Main';
import theme from 'style/theme';

function App() {
  return (
    <ThemeProvider theme={theme}>
      <Header />
      <Main />
      <Footer />
    </ThemeProvider>
  );
}

export default App;
