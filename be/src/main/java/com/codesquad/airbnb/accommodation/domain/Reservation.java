package com.codesquad.airbnb.accommodation.domain;

import lombok.Getter;

import javax.persistence.*;

import static javax.persistence.FetchType.*;

@Getter
@Entity
public class Reservation {

    @GeneratedValue
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
