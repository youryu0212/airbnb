package com.team14.cherrybnb.auth.domain;

import com.team14.cherrybnb.room.domain.Room;

import javax.persistence.*;
import java.util.List;

public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Long id;

    private String name;

    private String email;

    private String oauthAccessToken;

    private String oauthRefreshToken;

    private String resourceServer;

    @OneToMany(mappedBy = "member")
    private List<Room> rooms;

    private Long addressId;
}
