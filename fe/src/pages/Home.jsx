import styled from 'styled-components';
import BackgroundSrc from 'images/FE_숙소예약서비스/hero-img.svg';

function Home() {
  return <StyledBackgroundImg src={BackgroundSrc} alt="" />;
}

const StyledBackgroundImg = styled.img`
  width: 100%;
  background-size: 100% 640px;
`;
export default Home;
