package com.codesquad.airbnb.accommodation.web.dto;

public class PriceConditionDto {
    private String checkInDate;
    private String checkOutDate;

    public PriceConditionDto(String checkInDate, String checkOutDate) {
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
