package com.codesquad.airbnb.common.util;

import com.codesquad.airbnb.naverapi.ApiKey;
import com.codesquad.airbnb.naverapi.domain.GeoCode;
import com.codesquad.airbnb.naverapi.web.dto.apiresponse.NaverAPIResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@Slf4j
public class NaverAPIConnector {

    private static final String NAVER_API_URL = "https://naveropenapi.apigw.ntruss.com";
    private static final String NAVER_API_GEOCODE_PATH = "/map-geocode/v2/geocode";
    private static final String NAVER_API_KEY_ID_HEADER = "X-NCP-APIGW-API-KEY-ID";
    private static final String NAVER_API_SECRET_KEY_HEADER = "X-NCP-APIGW-API-KEY";

    private NaverAPIConnector() {

    }

    public static GeoCode convertToGeoCode(String address, ApiKey apiKey) {
        URI uri = getUri(address);

        RestTemplate restTemplate = new RestTemplate();

        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .header(NAVER_API_KEY_ID_HEADER, apiKey.getId())
                .header(NAVER_API_SECRET_KEY_HEADER, apiKey.getSecretKey())
                .build();

        ResponseEntity<NaverAPIResponse> result = restTemplate.exchange(req, NaverAPIResponse.class);

        NaverAPIResponse responseBody = getResponseBody(result);

        String latitude = responseBody.getAddresses().get(0).getX();
        String longitude = responseBody.getAddresses().get(0).getY();

        return new GeoCode(latitude, longitude);
    }

    private static NaverAPIResponse getResponseBody(ResponseEntity<NaverAPIResponse> result) {
        NaverAPIResponse resultBody = result.getBody();
        int count = Integer.parseInt(resultBody.getMeta().get("count"));
        if (count <= 0) {
            throw new IllegalArgumentException("해당 주소로 조회한 결과가 없습니다.");
        }
        return resultBody;
    }

    private static URI getUri(String addressString) {
        return UriComponentsBuilder
                .fromUriString(NAVER_API_URL)
                .path(NAVER_API_GEOCODE_PATH)
                .queryParam("query", addressString)
                .encode()
                .build()
                .toUri();
    }
}
