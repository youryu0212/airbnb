import { flexColumn } from 'style/mixins';
import styled from 'styled-components';

function Content({ data }) {
  return (
    <FooterContent>
      <FooterContentTitle>{data.title}</FooterContentTitle>
      {data.info.map((el, idx) => (
        <FooterContentText key={idx}>{el}</FooterContentText>
      ))}
    </FooterContent>
  );
}

const FooterContent = styled.div`
  ${flexColumn}
  margin-top: 20px;
  margin-left: 30px;
  width: 25%;
`;

const FooterContentTitle = styled.p`
  font-weight: bold;
  margin: 10px;
`;

const FooterContentText = styled.p`
  margin: 10px;
`;

export default Content;
