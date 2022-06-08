package com.codesquad.airbnb.user.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JwtTokenProvider {
    public String createAccessToken(String id) {

        return JWT.create()
                .withSubject("jwtToken")
                .withExpiresAt(new Date(System.currentTimeMillis() + 1800))
                .withClaim("id", id)
                .sign(Algorithm.HMAC256("kim"));
    }
}
