package com.team14.cherrybnb.revervation.domain;

import com.team14.cherrybnb.room.domain.Room;

import javax.persistence.*;

public class ReservationRoom {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_room_id")
    private Long id;

    @JoinColumn
    @ManyToOne
    private Reservation reservation;

    @JoinColumn
    @ManyToOne
    private Room room;
}
