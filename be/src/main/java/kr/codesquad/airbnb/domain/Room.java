package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
public class Room {

    @Id
    @GeneratedValue
    @Column(name = "room_id")
    private Long id;

    @OneToMany(mappedBy = "room")
    private List<Booking> bookings = new ArrayList<>();

    private String name;
    private String image;
    private String details;
    private Integer pricePerNight;
    private Integer maxNumberOfGuest;

    @Embedded
    private Location location;

    @OneToMany(mappedBy = "room")
    private List<Discount> discounts = new ArrayList<>();

    @OneToMany(mappedBy = "room")
    private List<Tax> taxes = new ArrayList<>();
}
