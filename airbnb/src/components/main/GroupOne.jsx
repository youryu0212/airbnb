import styled from 'styled-components';
import { flexBetween } from 'style/mixins';

import MainTitle from './MainTitle';

function GroupOne({ title, data }) {
  return (
    <>
      <MainTitle title={title} />
      <Ul>
        {data.map(({ id, img, name, content }) => (
          <Li key={id}>
            <Box1>
              <img src={img} alt={name} />
            </Box1>
            <Box2>
              <Content>{name}</Content>
              <Content>{content}</Content>
            </Box2>
          </Li>
        ))}
      </Ul>
    </>
  );
}

const Ul = styled.ul`
  ${flexBetween};
  width: 100%;
  flex-flow: row wrap;
`;

const Li = styled.li`
  width: 25%;
`;

const Box1 = styled.div`
  width: 150px;
  height: 200px;
  float: left;
  margin-right: 10px;

  img {
    width: 150px;
    height: 150px;
  }
`;
const Box2 = styled.div`
  width: 200px;
  height: 150px;
  float: left;
`;

const Content = styled.span`
  width: 100%;
  font-size: ${({ theme }) => theme.fontSizes.xl};
  margin-top: 30px;
`;
export default GroupOne;
