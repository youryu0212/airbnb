package com.codesquad.airbnb.naverapi.web.dto;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class Address {
    private static final StringBuffer sb = new StringBuffer();

    private String city;
    private String district;
    private String street;
    private String numberOfStreet;
    private String nameOfBuilding;

    public String toValue() {
        init();

        StringBuffer result = sb.append(city)
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

    private void init() {
        sb.setLength(0);
    }
}
