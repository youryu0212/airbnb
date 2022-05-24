package com.team14.cherrybnb.room.domain;

import com.team14.cherrybnb.revervation.domain.Member;

import javax.persistence.*;

public class Wish {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wish_id")
    private Long id;

    @ManyToOne
    @JoinColumn
    private Member member;

    @ManyToOne
    @JoinColumn
    private Room room;
}
