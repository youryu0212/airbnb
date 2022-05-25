package com.team14.cherrybnb.revervation.dto;

import com.team14.cherrybnb.auth.domain.Member;
import com.team14.cherrybnb.common.domain.Address;
import com.team14.cherrybnb.room.domain.RoomImage;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class ReservationDetailResponse {

    private List<RoomImage> roomImages;

    private Address address;

    private String name;

    private LocalDateTime checkIn;

    private LocalDateTime checkOut;

    private Member host;

    private BigDecimal totalPrice;

    private int guestCount;
}
