import styled from 'styled-components';
import { ModalWrap } from './styled';

function PriceModal() {
  return <PriceModalWrap>가격모달</PriceModalWrap>;
}

const PriceModalWrap = styled(ModalWrap)`
  width: 493px;
  height: 364px;
  display: none;
`;
export default PriceModal;
