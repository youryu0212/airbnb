package com.codesquad.airbnb.naverapi.web.dto;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class Address {
    private String state;
    private String city;
    private String district;
    private String street;
    private String numberOfStreet;
    private String nameOfBuilding;

    public String toValue() {
        StringBuilder sb = new StringBuilder();

        StringBuilder result = sb
                .append(state)
                .append(" ")
                .append(city)
                .append(" ")
                .append(district)
                .append(" ")
                .append(street)
                .append(" ")
                .append(numberOfStreet)
                .append(" ")
                .append(nameOfBuilding);

        log.debug("Address: {}", result);
        return result.toString();
    }
}
