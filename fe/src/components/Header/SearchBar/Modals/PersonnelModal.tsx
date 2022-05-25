import styled from 'styled-components';
import { ModalWrap } from './styled';

function PersonnelModal() {
  return <PersonnelModalWrap>인원모달</PersonnelModalWrap>;
}

const PersonnelModalWrap = styled(ModalWrap)`
  width: 400px;
  height: 355px;
  display: none;
`;
export default PersonnelModal;
