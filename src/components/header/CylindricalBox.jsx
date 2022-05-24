import React from "react";
import styled from "styled-components";
import Cylindrical from "../../cylindrical";

// eslint-disable-next-line react/prop-types
const CylindricalBox = ({title, placeHolder, style}) => {
    return (
        <HoverCylindrical style={style}>
            <Title>{title}</Title>
            <PlaceHolder>{placeHolder}</PlaceHolder>
        </HoverCylindrical>
    );
};

const HoverCylindrical = styled(Cylindrical)`
    ${({theme}) => theme.layout.flexLayoutMixin("column")}
    padding: 16px 40px;
    box-sizing: border-box;
    gap: 0.25rem;
    cursor: pointer;
    &:hover {
        background-color: rgba(0, 0, 0, 0.1);
    }
`;

const Title = styled.div`
    font-size: 0.75rem;
    font-weight: bold;
    line-height: 1rem;
`;

const PlaceHolder = styled.div`
    font-size: 1rem;
    line-height: 1.5rem;
    color: ${({theme}) => theme.color.gray2};
`;
export default CylindricalBox;
