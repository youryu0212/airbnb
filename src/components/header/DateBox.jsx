import React from "react";
import CheckIn from "./CheckIn";
import CheckOut from "./CheckOut";
import CylindricalBox from "./CylindricalBox";

const DateBox = () => {
    const cylindricalStyle = {
        width: "360px",
        height: "76px",
        border: "",
    };

    return (
        <>
            <CheckIn />
            <CheckOut />
        </>
    );
};

export default DateBox;
