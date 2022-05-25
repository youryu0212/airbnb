package com.codesquad.airbnb.naverapi;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Getter
@Component
public class ApiKey {
    @Value("${naver.client.id}")
    private String id;

    @Value("${naver.client.secret}")
    private String secretKey;
}
