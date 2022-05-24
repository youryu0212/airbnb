import React from 'react';
import CssBaseline from '@mui/material/CssBaseline';
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';

function App() {
  return (
    <Box
      sx={{
        minHeight: '640px',
        background: 'url(./assets/hero-img.jpg) no-repeat center top / cover'
      }}
    >
      <CssBaseline />
      <Container maxWidth="lg">content</Container>
    </Box>
  );
}

export default App;
