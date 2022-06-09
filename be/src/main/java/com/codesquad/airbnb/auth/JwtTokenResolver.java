package com.codesquad.airbnb.auth;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class JwtTokenResolver {

    private final String secret;

    public JwtTokenResolver(
            @Value("${jwt.secret}") String secret) {
        this.secret = secret;
    }

    public Long getPayload(String token) {
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(secret)).build();
        DecodedJWT decodedJWT = jwtVerifier.verify(token);
        Long id = decodedJWT.getClaim("id").asLong();

        return id;
    }
}
