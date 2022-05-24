import React from 'react';
import styled from 'styled-components';
import { Flex, Divider } from '@chakra-ui/react';
import { footerDataStream } from './footerData.js';

// function Footer() {
//   const [list, setList] = React.useState();
//   const FooterElement = (e) => {
//     return (
//       <FooterContent>
//         {e.map((element) => (
//           <FooterContentText>{element}</FooterContentText>
//         ))}
//       </FooterContent>
//     );
//   };

//   React.useEffect = () => {
//     setList(footerDataStream);
//   };

//   if (list) {
//     return (
//       <FooterDiv>
//         <Flex flexDirection="row">
//           <FooterElement e={list.introduce} />
//           <FooterElement e={list.community} />
//           <FooterElement e={list.hosting} />
//           <FooterElement e={list.support} />
//         </Flex>
//         <Flex flexDirection="row">
//           <p>2021 Logo, Inc</p>
//           <p>개인정보처리방침</p>
//           <p>이용약관</p>
//           <p>한국의 변경된 환불 정책</p>
//           <p>회사 세부정보</p>
//         </Flex>
//       </FooterDiv>
//     );
//   }
// }

function Footer() {
  return (
    <FooterDiv>
      <Flex flexDirection="row">
        <FooterContent>
          <FooterContentTitle>소개</FooterContentTitle>
          {footerDataStream.introduce.map((element) => (
            <FooterContentText>{element}</FooterContentText>
          ))}
        </FooterContent>
        <FooterContent>
          <FooterContentTitle>커뮤니티</FooterContentTitle>
          {footerDataStream.community.map((element) => (
            <FooterContentText>{element}</FooterContentText>
          ))}
        </FooterContent>
        <FooterContent>
          <FooterContentTitle>호스팅하기</FooterContentTitle>
          {footerDataStream.hosting.map((element) => (
            <FooterContentText>{element}</FooterContentText>
          ))}
        </FooterContent>
        <FooterContent>
          <FooterContentTitle>지원</FooterContentTitle>
          {footerDataStream.support.map((element) => (
            <FooterContentText>{element}</FooterContentText>
          ))}
        </FooterContent>
      </Flex>
      <Flex flexDirection="row">
        <p>2021 Logo, Inc</p>
        <p>개인정보처리방침</p>
        <p>이용약관</p>
        <p>한국의 변경된 환불 정책</p>
        <p>회사 세부정보</p>
      </Flex>
    </FooterDiv>
  );
}

const FooterDiv = styled.div`
  display: flex;
  flex-direction: column;
  background: ${({ theme }) => theme.colors.gray6};
  height: 600px;
  font-size: ${({ theme }) => theme.size.xs};
  padding: 80px 10px 80px 80px;
`;
const FooterContent = styled.div`
  display: flex;
  flex-direction: column;
`;

const FooterContentTitle = styled.p`
  font-weight: bold;
  margin: 10px;
`;
const FooterContentText = styled.p`
  margin: 10px;
`;

export default Footer;
