package com.codesquad.airbnb.naverapi.domain;

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

    private GeoCode(String latitude, String longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public static GeoCode getGeoCode(String address, ApiKey apiKey) throws ParseException {
        URI uri = getUri(address);

        RestTemplate restTemplate = new RestTemplate();

        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .header(NAVER_API_KEY_ID_HEADER, apiKey.getId())
                .header(NAVER_API_SECRET_KEY_HEADER, apiKey.getSecretKey())
                .build();

        ResponseEntity<String> result = restTemplate.exchange(req, String.class);

        JSONObject addressJSONObject = getJsonObject(result);

        return new GeoCode(getLatitude(addressJSONObject), getLongitude(addressJSONObject));
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
        JSONArray addresses = (JSONArray) jsonObject.get("addresses");

        return (JSONObject) addresses.get(0);
    }


    private static String getLatitude(JSONObject addressJSONObject) {
        return addressJSONObject.get("y").toString();
    }

    private static String getLongitude(JSONObject addressJSONObject) {
        return addressJSONObject.get("x").toString();
    }
}
