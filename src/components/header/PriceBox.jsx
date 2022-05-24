import React from "react";
import CylindricalBox from "./CylindricalBox";

const PriceBox = () => {
    const cylindricalStyle = {
        width: "256px",
        height: "76px",
        border: "",
    };

    return <CylindricalBox title={"요금"} placeHolder={"금액대 설정"} style={cylindricalStyle} />;
};

export default PriceBox;
