package com.codesquad.airbnb.common.util;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class CalculatorUtils {
    private static final double RADIUS = 6371000;
    private static final double TO_RADIAN = Math.PI / 180;

    private CalculatorUtils() {
    }

    /**
     * @param latitude1  - base latitude
     * @param longitude1 - base longitude
     * @param latitude2  - reference latitude
     * @param longitude2 - reference longitude
     * @return distance of two points in meter
     */
    public static int calculateDistance(double latitude1, double longitude1, double latitude2, double longitude2) {
        double deltaLatitude = Math.abs(latitude1 - latitude2) * TO_RADIAN;
        double deltaLongitude = Math.abs(longitude1 - longitude2) * TO_RADIAN;

        double sinDeltaLatitude = Math.sin(deltaLatitude / 2);
        double sinDeltaLongitude = Math.sin(deltaLongitude / 2);

        double squareRoot = Math.sqrt(sinDeltaLatitude * sinDeltaLatitude
                + Math.cos(latitude1 * TO_RADIAN) * Math.cos(latitude2 * TO_RADIAN) * sinDeltaLongitude * sinDeltaLongitude);

        return (int) (2 * RADIUS * Math.asin(squareRoot));
    }

    public static int calculateNights(LocalDate checkInDate, LocalDate checkOutDate) {
        LocalDateTime checkInDateTime = checkInDate.atStartOfDay();
        LocalDateTime checkOutDateTime = checkOutDate.atStartOfDay();
        return (int) Duration.between(checkInDateTime, checkOutDateTime).toDays();
    }
}
