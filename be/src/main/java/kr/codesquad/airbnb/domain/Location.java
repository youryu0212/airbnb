package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.Embeddable;

@Embeddable
@Getter
public class Location {

    private double latitude;
    private double longitude;
}
