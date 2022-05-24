import React from "react";
import styled from "styled-components";
import Cylindrical from "../../cylindrical";

const LoginButton = () => {
    const cylindricalStyle = {
        width: "76px",
        height: "40px",
        borderColor: "#BDBDBD",
        backgroundColor: "white",
        isHover: false,
    };

    return (
        <LoginButtonBox style={cylindricalStyle}>
            <Icon>
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-6 w-6"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth="2"
                >
                    <path strokeLinecap="round" strokeLinejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
            </Icon>
            <UserIcon>
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-6 w-6"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth="2"
                >
                    <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                    />
                </svg>
            </UserIcon>
        </LoginButtonBox>
    );
};

const LoginButtonBox = styled(Cylindrical)`
    ${({theme}) => theme.layout.flexLayoutMixin("row", "center", "center")}
    gap: 10px;
    padding: 0px 0px 0px 4px;
    cursor: pointer;
`;

const Icon = styled.div`
    color: ${({theme}) => theme.color.gray2};
    width: 18px;
`;

const UserIcon = styled(Icon)`
    background-color: ${({theme}) => theme.color.gray3};
    border-radius: 50%;
    color: ${({theme}) => theme.color.white};
    padding: 8px;
`;

export default LoginButton;
