import styled from 'styled-components';

export const Header = styled.header`
  // 이미지 추가 예정
`;

export const Logo = styled.h1`
  position: absolute;
  top: 2.4rem;
  left: 8rem;
  font-weight: ${({ theme: { fontWeight } }) => fontWeight.black};
  font-size: ${({ theme: { fontSize } }) => fontSize.xxl};
  line-height: ${({ theme: { lineHeight } }) => lineHeight.logo};
  letter-spacing: ${({ theme: { letterSpacing } }) => letterSpacing.tighter};
`;
