import styled from 'styled-components';
import { ReactComponent as SearchIcon } from 'images/FE_숙소예약서비스/Property 1=search.svg';
import { ReactComponent as CrossIcon } from 'images/FE_숙소예약서비스/Property 1=x-circle.svg';

export const SearchBarWrap = styled.div`
  width: 916px;
  height: 76px;
  display: flex;
  align-items: center;
  border: 1px solid ${({ theme }) => theme.colors.grey4};
  border-radius: 999px;
  padding: 16px 0px 16px 20px;
  justify-content: space-around;
`;
export const Period = styled.div`
  height: 100%;
  display: flex;
  align-items: center;
`;

export const CommonWrapper = styled.div`
  display: flex;
  flex-direction: column;
`;

export const PriceWrapper = styled(CommonWrapper)`
  width: 200px;
`;

export const Price = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
`;

export const Personnel = styled.div`
  display: flex;
  align-items: center;

  div {
    width: 96px;
  }
`;

export const Label = styled.span`
  display: inline-block;
  margin-bottom: 4px;
  ${({ theme }) => theme.fontStyles.bold12px};
`;

export const Btn = styled.button`
  color: ${({ theme }) => theme.colors.grey2};
  ${({ theme }) => theme.fontStyles.normal16px};
  text-align: left;
`;

export const CheckIn = styled(Label)`
  width: 112px;
  height: 17px;
`;

export const CheckOut = styled(CheckIn)``;

export const SearchButton = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 8px;
  height: 42px;
  border-radius: 999px;
  background: ${({ theme }) => theme.colors.primary};

  span {
    margin: 0 8px;
    color: ${({ theme }) => theme.colors.white};
    ${({ theme }) => theme.fontStyles.bold18px};
  }
`;

export const StyledSearchIcon = styled(SearchIcon)`
  path {
    stroke: ${({ theme }) => theme.colors.white};
  }
`;

export const StyledCrossIcon = styled(CrossIcon)`
  path {
    fill: ${({ theme }) => theme.colors.grey6};
  }
`;
