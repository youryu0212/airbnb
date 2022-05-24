import styled from "styled-components";

const Cylindrical = styled.div`
    width: ${({width}) => width};
    height: ${({height}) => height};
    border: 1px ${({borderColor}) => borderColor} solid;
    border-radius: 999px;
    background-color: ${({isHover, backgroundColor}) => (isHover ? "none" : backgroundColor)};
    &:hover {
        background-color: ${({isHover, backgroundColor}) => (isHover ? backgroundColor : "none")};
    }
`;

export default Cylindrical;
