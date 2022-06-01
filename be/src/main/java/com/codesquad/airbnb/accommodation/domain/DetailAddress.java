package com.codesquad.airbnb.accommodation.domain;

import lombok.Getter;

import javax.persistence.Embeddable;

@Getter
@Embeddable
public class DetailAddress {
    private String country;
    private String city;
    private String region;
}
