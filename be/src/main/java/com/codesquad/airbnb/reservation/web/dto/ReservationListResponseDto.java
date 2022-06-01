package com.codesquad.airbnb.reservation.web.dto;

import com.codesquad.airbnb.accommodation.domain.DetailAddress;
import com.codesquad.airbnb.reservation.domain.Reservation;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class ReservationListResponseDto {

    private String imageLink;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private DetailAddress detailAddress;
    private String name;

    public ReservationListResponseDto(Reservation reservation) {
        this.imageLink = reservation.getMainImageLink();
        this.checkInDate = reservation.getCheckInDate();
        this.checkOutDate = reservation.getCheckOutDate();
        this.detailAddress = reservation.getDetailAddress();
        this.name = reservation.getName();
    }
}
