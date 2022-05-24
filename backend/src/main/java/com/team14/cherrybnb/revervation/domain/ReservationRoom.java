package com.team14.cherrybnb.revervation.domain;

import com.team14.cherrybnb.room.domain.Room;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ReservationRoom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn
    private Reservation reservation;

    @ManyToOne
    @JoinColumn
    private Room room;
}
