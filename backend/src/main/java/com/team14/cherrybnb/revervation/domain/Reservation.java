package com.team14.cherrybnb.revervation.domain;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime checkIn;

    private LocalDateTime checkOut;

    private int guestCount;

    private BigDecimal totalPrice;

    private boolean deleteYn;

    @OneToMany(mappedBy = "reservation")
    private List<ReservationRoom> reservationRooms;
}
