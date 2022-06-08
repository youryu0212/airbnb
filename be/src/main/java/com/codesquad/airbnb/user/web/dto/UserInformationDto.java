package com.codesquad.airbnb.user.web.dto;

import com.codesquad.airbnb.user.domain.User;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class UserInformationDto {

    private String oauthId;
    private String email;
    private String login;
    private GitHubAccessToken token;

    public UserInformationDto(String oauthId, String email, String login, GitHubAccessToken token) {
        this.oauthId = oauthId;
        this.email = email;
        this.login = login;
        this.token = token;
    }

    public User toEntity() {
        return new User(login, oauthId, token.getAccessToken(), email);
    }
}
