package com.codesquad.airbnb.naverapi.domain;

import com.codesquad.airbnb.common.util.CalculatorUtils;
import lombok.Getter;

@Getter
public class GeoCode {

    private String latitude;
    private String longitude;

    public GeoCode(String latitude, String longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
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
