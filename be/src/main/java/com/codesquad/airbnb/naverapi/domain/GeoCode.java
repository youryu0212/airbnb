package com.codesquad.airbnb.naverapi.domain;

import com.codesquad.airbnb.common.CalculatorUtils;
import com.codesquad.airbnb.naverapi.ApiKey;
import lombok.Getter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@Getter
public class GeoCode {
    private static final String NAVER_API_URL = "https://naveropenapi.apigw.ntruss.com";
    private static final String NAVER_API_GEOCODE_PATH = "/map-geocode/v2/geocode";
    private static final String NAVER_API_KEY_ID_HEADER = "X-NCP-APIGW-API-KEY-ID";
    private static final String NAVER_API_SECRET_KEY_HEADER = "X-NCP-APIGW-API-KEY";

    private String latitude;
    private String longitude;

    public GeoCode(String latitude, String longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public static GeoCode getGeoCodeFromNaverApi(String address, ApiKey apiKey) throws ParseException {
        URI uri = getUri(address);

        RestTemplate restTemplate = new RestTemplate();

        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .header(NAVER_API_KEY_ID_HEADER, apiKey.getId())
                .header(NAVER_API_SECRET_KEY_HEADER, apiKey.getSecretKey())
                .build();

        ResponseEntity<String> result = restTemplate.exchange(req, String.class);

        JSONObject addressJSONObject = getJsonObject(result);

        return new GeoCode(addressJSONObject.get("y").toString(), addressJSONObject.get("x").toString());
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

    private static JSONObject getJsonObject(ResponseEntity<String> result) throws ParseException {
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(result.getBody());
        Long count = (Long) ((JSONObject) jsonObject.get("meta")).get("count");
        if (count <= 0) {
            throw new IllegalArgumentException("해당 주소로 조회한 결과가 없습니다.");
        }

        JSONArray addresses = (JSONArray) jsonObject.get("addresses");

        return (JSONObject) addresses.get(0);
    }

    public String getLatitude() {
        return latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public int calculateDistance(String latitude, String longitude) {
        double baseLatitude = Double.parseDouble(this.latitude);
        double baseLongitude = Double.parseDouble(this.longitude);
        double referenceLatitude = Double.parseDouble(latitude);
        double referenceLongitude = Double.parseDouble(longitude);

        return CalculatorUtils.calculateDistance(baseLatitude, baseLongitude, referenceLatitude, referenceLongitude);
    }
}
