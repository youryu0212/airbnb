package com.codesquad.airbnb.auth.interceptor;


import com.codesquad.airbnb.auth.JwtTokenResolver;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

@Slf4j
@Component("authenticationInterceptor")
public class AuthenticationInterceptor implements HandlerInterceptor {

    private final JwtTokenResolver jwtTokenResolver;

    public AuthenticationInterceptor(JwtTokenResolver jwtTokenResolver) {
        this.jwtTokenResolver = jwtTokenResolver;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Optional<String> jwtToken = getJwtToken(request);
        if (jwtToken.isEmpty()) {
            throw new IllegalArgumentException("토큰이 없습니다. 로그인을 진행해주세요");
        }

        Long id = jwtTokenResolver.getPayload(jwtToken.get());
        log.debug("JwtInterceptor, payload: {}", id);

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    private Optional<String> getJwtToken(HttpServletRequest request) {
        String authorization = request.getHeader("Authorization");
        log.debug("JwtInterceptor: {}", authorization);

        if (authorization == null) {
            return Optional.empty();
        }

        String[] token = authorization.split(" ");
        if (token.length == 2 && token[0].equals("Bearer")) {
            return Optional.ofNullable(token[1]);
        }

        return Optional.empty();
    }
}
