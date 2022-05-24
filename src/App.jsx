import React from "react";
import {ThemeProvider} from "styled-components";
import theme from "./theme";
import Header from "./components/header/Header";

const App = () => {
    return (
        <ThemeProvider theme={theme}>
            <Header />
        </ThemeProvider>
    );
};

export default App;
