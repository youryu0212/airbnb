import styled from 'styled-components';

function Title({ title }) {
  return <MainTitle>{title}</MainTitle>;
}

const MainTitle = styled.h2`
  font-size: 32px;
  margin: 20px 0;
`;

export default Title;
