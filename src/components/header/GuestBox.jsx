import React from "react";
import CylindricalBox from "./CylindricalBox";

const GuestBox = () => {
    const cylindricalStyle = {
        width: "298px",
        height: "76px",
        border: "",
    };

    return <CylindricalBox title={"인원"} placeHolder={"게스트 추가"} style={cylindricalStyle} />;
};

export default GuestBox;
