import React from "react";
import styled from "styled-components";
import Cylindrical from "../../cylindrical";
import PriceBox from "./PriceBox";
import GuestBox from "./GuestBox";
import DateBox from "./DateBox";
import Boundary from "../Boundary";

const SearchBar = () => {
    const cylindricalStyle = {
        height: "76px",
        border: "1px #BDBDBD solid",
    };

    const boundaryCondition = {
        direction: "vertical",
        weight: "1px",
        length: "44px",
        backgroundColor: "#E0E0E0",
    };

    return (
        <SearchBarBox style={cylindricalStyle}>
            <DateBox />
            <Boundary condition={boundaryCondition} />
            <PriceBox />
            <Boundary condition={boundaryCondition} />
            <GuestBox />
        </SearchBarBox>
    );
};

const SearchBarBox = styled(Cylindrical)`
    ${({theme}) => theme.layout.flexLayoutMixin("row", "flex-start", "center")}
    position: absolute;
    top: 20%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: ${({theme}) => theme.color.white};
`;

export default SearchBar;
