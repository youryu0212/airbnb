package com.codesquad.airbnb.user.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Component
public class JwtTokenProvider {

    private static final int DEFAULT_EXPIRE_MINUTE = 30;

    private final String secret;

    public JwtTokenProvider(
            @Value("${jwt.secret}") String secret) {
        this.secret = secret;
    }

    public String createAccessToken(String id) {

        return JWT.create()
                .withSubject("jwtToken")
                .withExpiresAt(Date.from(Instant.now().plus(DEFAULT_EXPIRE_MINUTE, ChronoUnit.MINUTES)))
                .withClaim("id", id)
                .sign(Algorithm.HMAC256(secret));
    }
}
