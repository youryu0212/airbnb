package com.team14.cherrybnb.revervation.domain;

import javax.persistence.OneToMany;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class Reservation {

    private LocalDateTime checkIn;

    private LocalDateTime checkOut;

    private int guestCount;

    private BigDecimal totalPrice;

    private boolean deleteYn;

    @OneToMany(mappedBy = "reservation")
    private List<ReservationRoom> reservationRooms;
}
