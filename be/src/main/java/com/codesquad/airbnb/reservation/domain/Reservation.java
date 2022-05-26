package com.codesquad.airbnb.reservation.domain;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import lombok.Getter;

import javax.persistence.*;

import static javax.persistence.FetchType.*;
import static javax.persistence.GenerationType.IDENTITY;

@Getter
@Entity
public class Reservation {

    @GeneratedValue(strategy = IDENTITY)
    @Id
    private Long id;

    @Column(nullable = false)
    private String checkInDate;

    @Column(nullable = false)
    private String checkOutDate;

    @JoinColumn(nullable = false)
    @ManyToOne(fetch = LAZY)
    private Accommodation accommodation;

    private int fee;
    private int clientCount;

    @Column(nullable = false, columnDefinition = "BOOLEAN")
    private boolean cancelled;

}
