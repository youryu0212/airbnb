import React, {useState} from "react";
import styled from "styled-components";
import Cylindrical from "../../cylindrical";

// eslint-disable-next-line react/prop-types
const CylindricalBox = ({title, placeHolder, style, partId, clickedPart, setClickedPart}) => {
    const changeClickedPart = () => {
        if (partId === clickedPart) {
            setClickedPart(null);
        } else {
            setClickedPart(partId);
        }
    };

    return (
        <CylindricalButton isClicked={partId === clickedPart} style={style} onClick={changeClickedPart}>
            <Title>{title}</Title>
            <PlaceHolder>{placeHolder}</PlaceHolder>
        </CylindricalButton>
    );
};

const CylindricalButton = styled(Cylindrical)`
    ${({theme}) => theme.layout.flexLayoutMixin("column")}
    padding: 16px 40px;
    box-sizing: border-box;
    gap: 4px;
    cursor: pointer;
    box-shadow: ${({isClicked}) => (isClicked ? "0px 10px 20px rgba(0, 0, 0, 0.2)" : "")};
    &:hover {
        background-color: ${({isClicked}) => (isClicked ? "#fff" : "rgba(0, 0, 0, 0.1)")};
    }
`;

const Title = styled.div`
    font-size: 0.75rem;
    font-weight: 700;
    line-height: 16px;
`;

const PlaceHolder = styled.div`
    font-size: 1rem;
    line-height: 24px;
    color: ${({theme}) => theme.color.gray2};
`;
export default CylindricalBox;
