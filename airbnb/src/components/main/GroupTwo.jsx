import { Flex, Spacer } from '@chakra-ui/react';
import { Fragment } from 'react';
import styled from 'styled-components';
import Title from './Title';

function GroupTwo({ title, data }) {
  return (
    <>
      <Title title={title} />
      <Flex>
        {data.map(({ id, img, name, content }) => (
          <Fragment key={id}>
            <Div>
              <img src={img} alt={name} />
              <span>{content}</span>
            </Div>
            <Spacer />
          </Fragment>
        ))}
      </Flex>
    </>
  );
}

const Div = styled.div`
  img {
    width: 350px;
  }
  span {
    display: block;
    font-size: ${({ theme }) => theme.size.xl};
    margin-top: 10px;
  }
`;

export default GroupTwo;
