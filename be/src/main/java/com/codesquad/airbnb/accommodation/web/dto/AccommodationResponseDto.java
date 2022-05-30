package com.codesquad.airbnb.accommodation.web.dto;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import lombok.Getter;

@Getter
public class AccommodationResponseDto {
    private long id;
    private String name;

    public AccommodationResponseDto(Accommodation accommodation) {
        this.id = accommodation.getId();
        this.name = accommodation.getName();
    }
}
