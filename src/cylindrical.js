import styled from "styled-components";

const Cylindrical = styled.div`
    width: ${({width}) => width};
    height: ${({height}) => height};
    border: ${({border}) => border};
    border-radius: 999px;
`;

export default Cylindrical;
