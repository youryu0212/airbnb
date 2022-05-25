package com.codesquad.airbnb.naverapi.domain;

import org.assertj.core.data.Percentage;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class GeoCodeTest {

    @Test
    void calculateDistance() {
        String baseLatitude = "37.4783544";
        String baseLongitude = "126.9619196";
        String referenceLatitude = "37.4909040";
        String referenceLongitude = "127.0334410";

        GeoCode baseGeoCode = new GeoCode(baseLatitude, baseLongitude);

        int distance = baseGeoCode.calculateDistance(referenceLatitude, referenceLongitude);

        System.out.println(distance);
        assertThat(distance)
                .isCloseTo(6500, Percentage.withPercentage(5.0));
    }
}
