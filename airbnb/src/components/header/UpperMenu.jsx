import { Flex, Spacer } from '@chakra-ui/react';
import styled from 'styled-components';

function UpperMenu(props) {
  return (
    <Div>
      <Flex>
        <UpperMenuContent>숙소</UpperMenuContent>
        <Spacer />
        <UpperMenuContent>체험</UpperMenuContent>
        <Spacer />
        <UpperMenuContent>온라인 체험</UpperMenuContent>
      </Flex>
    </Div>
  );
}

const Div = styled.div`
  width: 15%;
`;

const UpperMenuContent = styled.p`
  background-color: ${({ theme }) => theme.colors.clearwhite};
  cursor: pointer;
  font-size: ${({ theme }) => theme.fontSizes.xs};
  font-weight: 600;
  padding: 10px;
  border-radius: 15px;
  &:hover {
    background-color: ${({ theme }) => theme.colors.white};
  }
`;

export default UpperMenu;
