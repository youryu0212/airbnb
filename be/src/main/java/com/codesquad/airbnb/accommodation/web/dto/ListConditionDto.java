package com.codesquad.airbnb.accommodation.web.dto;

public class ListConditionDto {
    private String checkInDate;
    private String checkOutDate;
    private String lowerBoundPrice;
    private String upperBoundPrice;
    private int clientCount;

    public ListConditionDto(String checkInDate, String checkOutDate, String lowerBoundPrice, String upperBoundPrice, int clientCount) {
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.lowerBoundPrice = lowerBoundPrice;
        this.upperBoundPrice = upperBoundPrice;
        this.clientCount = clientCount;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public String getLowerBoundPrice() {
        return lowerBoundPrice;
    }

    public String getUpperBoundPrice() {
        return upperBoundPrice;
    }

    public int getClientCount() {
        return clientCount;
    }
}
