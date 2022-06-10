package com.codesquad.airbnb.reservation.web.dto;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.DetailAddress;
import com.codesquad.airbnb.reservation.domain.Reservation;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
public class ReservationListResponseDto {

    private String imageLink;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private DetailAddress detailAddress;
    private String name;

    public ReservationListResponseDto(Reservation reservation) {
        Accommodation accommodation = reservation.getAccommodation();

        this.imageLink = accommodation.getMainImageLink();
        this.checkInDate = reservation.getCheckInDate();
        this.checkOutDate = reservation.getCheckOutDate();
        this.detailAddress = accommodation.getDetailAddress();
        this.name = accommodation.getName();
    }
}
