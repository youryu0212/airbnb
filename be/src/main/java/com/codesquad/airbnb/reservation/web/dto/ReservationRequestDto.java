package com.codesquad.airbnb.reservation.web.dto;

import lombok.Getter;

import java.time.LocalDate;

@Getter
public class ReservationRequestDto {
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private int countOfGuest;
    private long accommodationId;
}
