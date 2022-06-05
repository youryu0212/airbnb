package com.codesquad.airbnb.reservation.web.dto;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.DetailAddress;
import com.codesquad.airbnb.accommodation.web.dto.HostResponseDto;
import com.codesquad.airbnb.reservation.domain.Reservation;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
public class ReservationDetailDto {

    private String name;
    private DetailAddress detailAddress;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private HostResponseDto hostResponseDto;
    private String roomType;
    private int countOfGuest;
    private int fee;

    public ReservationDetailDto(Reservation reservation) {
        Accommodation accommodation = reservation.getAccommodation();

        this.name = accommodation.getName();
        this.detailAddress = accommodation.getDetailAddress();
        this.checkInDate = reservation.getCheckInDate();
        this.checkOutDate = reservation.getCheckOutDate();
        this.hostResponseDto = new HostResponseDto(accommodation.getHost());
        this.roomType = accommodation.getAccommodationCondition().getRoomType();
        this.countOfGuest = reservation.getCountOfGuest();
        this.fee = reservation.getFee();
    }
}
