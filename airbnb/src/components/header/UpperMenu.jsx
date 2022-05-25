import { Flex, Spacer } from '@chakra-ui/react';
import styled from 'styled-components';

function UpperMenu(props) {
  return (
    <Div>
      <Flex>
        <div>숙소</div>
        <Spacer />
        <div>체험</div>
        <Spacer />
        <div>온라인 체험</div>
      </Flex>
    </Div>
  );
}

const Div = styled.div`
  width: 15%;
  cursor: pointer;
  font-size: ${({ theme }) => theme.fontSizes.l};
`;
export default UpperMenu;
