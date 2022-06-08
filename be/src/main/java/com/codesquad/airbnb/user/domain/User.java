package com.codesquad.airbnb.user.domain;

import com.codesquad.airbnb.common.BaseTime;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import static javax.persistence.GenerationType.IDENTITY;

@NoArgsConstructor
@Getter
@Entity
public class User extends BaseTime {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    private String username;

    private String oauthId;

    private String token;

    private String email;

    public User(String username, String oauthId, String token, String email) {
        this.username = username;
        this.oauthId = oauthId;
        this.token = token;
        this.email = email;
    }
}
