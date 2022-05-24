import React from 'react';
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';

function App() {
  return (
    <Box
      component="header"
      sx={{
        minHeight: '640px',
        background: 'url(./assets/hero-img.jpg) no-repeat center top / cover'
      }}
    >
      <Container maxWidth="lg" />
    </Box>
  );
}

export default App;
