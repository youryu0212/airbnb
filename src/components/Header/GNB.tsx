import React, { useState } from 'react';
import { Container, GNBItem } from '@components/Header/GNB.style';

const GNB_ITEMS = ['숙소', '요금', '인원'];

function GNB() {
  const [selecetedNavIdx, setSelectedNavIdx] = useState(0);

  const handleNavClick = (idx: number) => {
    setSelectedNavIdx(idx);
  };

  return (
    <Container>
      {GNB_ITEMS.map((item, idx) => (
        <GNBItem
          key={idx}
          to="/"
          onClick={() => handleNavClick(idx)}
          isSelected={selecetedNavIdx === idx}
        >
          {item}
        </GNBItem>
      ))}
    </Container>
  );
}

export default GNB;
