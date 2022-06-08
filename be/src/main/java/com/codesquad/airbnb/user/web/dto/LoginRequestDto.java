package com.codesquad.airbnb.user.web.dto;

import lombok.Getter;

@Getter
public class LoginRequestDto {

    private String accessToken;
    private String expiresIn;
    private String refreshToken;
    private String refreshTokenExpiresIn;
    private String scope;
    private String tokenType;
}
