import React from 'react';
import { Header, Logo } from 'components/Hero/Hero.styled';

function Hero() {
  return (
    <Header>
      <img
        src={`${process.env.PUBLIC_URL}/assets/images/hero-img.png`}
        alt="남자가 얕은 물에서 배를 육지로 끌고 오고 있다."
      />
      <Logo>AIRBNB</Logo>
    </Header>
  );
}

export default Hero;
