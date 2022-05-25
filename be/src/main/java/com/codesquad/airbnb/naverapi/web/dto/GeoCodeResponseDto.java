package com.codesquad.airbnb.naverapi.web.dto;

import lombok.Getter;

@Getter
public class GeoCodeResponseDto {
    private String latitude;
    private String longitude;

    public GeoCodeResponseDto(String latitude, String longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }
}
