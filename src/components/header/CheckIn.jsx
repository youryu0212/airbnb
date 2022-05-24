import React from "react";
import CylindricalBox from "./CylindricalBox";

const CheckIn = () => {
    const cylindricalStyle = {
        width: "152px",
        height: "76px",
        border: "",
    };
    return <CylindricalBox title={"체크인"} placeHolder={"날짜 입력"} style={cylindricalStyle} />;
};

export default CheckIn;
