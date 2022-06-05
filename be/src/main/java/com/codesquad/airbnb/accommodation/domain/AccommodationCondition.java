package com.codesquad.airbnb.accommodation.domain;

import lombok.Getter;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Getter
@Embeddable
public class AccommodationCondition {

    private int maxCountOfGuest;
    private String roomType;
    private int countOfBed;
    private int countOfBathroom;

    @Column(columnDefinition = "Boolean")
    private Boolean kitchen;

    @Column(columnDefinition = "Boolean")
    private Boolean wirelessInternet;

    @Column(columnDefinition = "Boolean")
    private Boolean airConditioner;

    @Column(columnDefinition = "Boolean")
    private Boolean hairDryer;
}
