import { Flex, Spacer, Box, Text, Divider } from '@chakra-ui/react';
import styled from 'styled-components';

const borderStyle = '1px solid ${({ theme }) => theme.color.gray5}';

function SearchBar() {
  return (
    <Flex
      color="black"
      background="white"
      fontSize="12px"
      width="916px"
      height="76px"
      border="1px solid gray5"
      borderRadius="60px"
    >
      <Box>
        <Text>체크인</Text>
        <Text>날짜입력</Text>
        <Divider colorScheme="gray" variant="solid" orientation="vertical" />
      </Box>
      <Box>
        <Text>체크아웃</Text>
        <Divider orientation="vertical" />
      </Box>
      <Box>
        <Text>요금</Text>
        <Divider orientation="vertical" />
      </Box>
      <Box>
        <Text>인원</Text>
      </Box>
      <Box>검색아이콘</Box>
    </Flex>
  );
}

const SearchBarDiv = styled.div`
  display: flex;
  align-items: center;
  width: 916px;
  height: 76px;
  left: 262px;
  top: 110px;

  background: ${({ theme }) => theme.colors.white};
  border: 1px solid ${({ theme }) => theme.colors.gray4};
  border-radius: 60px;
`;

const SearchBarContent = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding: 0px;
  gap: 4px;

  width: 112px;
  height: 44px;

  border-right-style: 1px solid ${({ theme }) => theme.colors.gray4};
`;

export default SearchBar;
