package com.codesquad.airbnb.reservation.web.dto;

import lombok.Getter;

@Getter
public class ReservationListResponseDto {

    private String imageLink;
    private String checkInDate;
    private String checkOutDate;
    private String location;
    private String name;
}
