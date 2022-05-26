package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.Embeddable;

@Embeddable
@Getter
public class Location {

    private String address;
    private double latitude;
    private double longitude;
}
