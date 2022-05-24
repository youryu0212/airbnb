import { createTheme } from '@material-ui/core';

export const theme = createTheme({
  overrides: {
    MuiCssBaseline: {
      '@global': {
        '*': {
          margin: 0,
          padding: 0,
          boxSizing: 'border-box',
          fontFamily: 'Noto Sans KR',
        },
        button: {
          border: 'none',
          outline: 'none',
          background: 'transparent',
          cursor: 'pointer',
          fontFamily: 'Noto Sans KR',
        },
        a: {
          textDecoration: 'none',
          color: 'inherit',
        },
      },
    },
  },
});
