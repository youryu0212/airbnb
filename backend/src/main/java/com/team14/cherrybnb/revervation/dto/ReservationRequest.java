package com.team14.cherrybnb.revervation.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class ReservationRequest {

    private LocalDateTime checkIn;

    private LocalDateTime checkOut;

    private int guestCount;

    private BigDecimal totalPrice;

}
