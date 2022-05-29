package com.codesquad.airbnb.accommodation.web.dto;

public class PriceSearchCondition {
    private String checkInDate;
    private String checkOutDate;

    public PriceSearchCondition(String checkInDate, String checkOutDate) {
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }
}
