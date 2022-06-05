package com.codesquad.airbnb.accommodation.web.dto;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import lombok.Getter;

@Getter
public class AccommodationResponseDto {
    private long id;
    private String name;
    private double latitude;
    private double longitude;
    private HostResponseDto host;

    public AccommodationResponseDto(Accommodation accommodation) {
        this.id = accommodation.getId();
        this.name = accommodation.getName();
        this.latitude = accommodation.getLocation().getY();
        this.longitude = accommodation.getLocation().getX();
        this.host = new HostResponseDto(accommodation.getHost());
    }
}
