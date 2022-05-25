package com.team14.cherrybnb.revervation.dto;

import com.team14.cherrybnb.common.domain.Address;
import com.team14.cherrybnb.room.domain.RoomImage;

import java.time.LocalDateTime;

public class ReservationCardResponse {

    private LocalDateTime checkIn;

    private LocalDateTime checkOut;

    private Address address;

    private String name;

    private RoomImage roomImage;
}
